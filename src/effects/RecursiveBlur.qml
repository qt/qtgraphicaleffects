/****************************************************************************
**
** Copyright (C) 2012 Nokia Corporation and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/
**
** This file is part of the Qt Graphical Effects module.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Nokia Corporation and its Subsidiary(-ies) nor
**     the names of its contributors may be used to endorse or promote
**     products derived from this software without specific prior written
**     permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0
import "private"

Item {
    id: rootItem
    property variant source
    property real radius: 0.0
    property bool cached: false
    property bool transparentBorder: false
    property int loops: 0
    property real progress: loops > 0.0 ? Math.min(1.0, recursionTimer.counter / loops) : 0.0

    onLoopsChanged: recursiveSource.scheduleUpdate()
    onSourceChanged: recursionTimer.reset()
    onRadiusChanged: recursionTimer.reset()
    onTransparentBorderChanged: recursionTimer.reset()

    SourceProxy {
        id: sourceProxy
        input: rootItem.source
        sourceRect: rootItem.transparentBorder ? Qt.rect(-1, -1, parent.width + 2, parent.height + 2) : Qt.rect(0, 0, 0, 0)
    }

    ShaderEffectSource {
        id: cacheItem
        anchors.fill: verticalBlur
        smooth: true
        visible: rootItem.cached
        hideSource: visible
        live: true
        sourceItem: inputItem.visible ? inputItem : verticalBlur
    }

    Item {
        id: recursionTimer
        property int counter: 0

        function reset() {
            counter = 0
            recursiveSource.scheduleUpdate()
        }

        function nextFrame() {
            if (loops < counter)
                recursionTimer.counter = 0

            if (counter > 0)
                recursiveSource.sourceItem = verticalBlur
            else
                recursiveSource.sourceItem = inputItem

            if (counter < loops) {
                recursiveSource.scheduleUpdate()
                counter++
            }
        }
    }

    ShaderEffect {
        id: inputItem
        property variant source: sourceProxy.output
        property real expandX: rootItem.transparentBorder ? (horizontalBlur.maximumRadius) / horizontalBlur.width : 0.0
        property real expandY: rootItem.transparentBorder ? (horizontalBlur.maximumRadius) / horizontalBlur.height : 0.0

        anchors.fill: verticalBlur
        visible: !verticalBlur.visible

        vertexShader: "
            attribute highp vec4 qt_Vertex;
            attribute highp vec2 qt_MultiTexCoord0;
            uniform highp mat4 qt_Matrix;
            uniform highp float expandX;
            uniform highp float expandY;
            varying highp vec2 qt_TexCoord0;

            void main() {
                mediump vec2 texCoord = qt_MultiTexCoord0;
                texCoord.s = (texCoord.s - expandX) / (1.0 - 2.0 * expandX);
                texCoord.t = (texCoord.t - expandY) / (1.0 - 2.0 * expandY);
                qt_TexCoord0 = texCoord;
                gl_Position = qt_Matrix * qt_Vertex;
            }
        "

        fragmentShader: "
            varying mediump vec2 qt_TexCoord0;
            uniform highp float qt_Opacity;
            uniform lowp sampler2D source;
            void main() {
                gl_FragColor = texture2D(source, qt_TexCoord0) * qt_Opacity;
            }
        "
    }

    ShaderEffectSource {
        id: recursiveSource
        visible: false
        smooth: true
        hideSource: false
        live: false
        sourceItem: inputItem
        recursive: true
        onSourceItemChanged: scheduleUpdate()
        onScheduledUpdateCompleted: recursionTimer.nextFrame()
    }

    GaussianDirectionalBlur {
        id: verticalBlur
        x: rootItem.transparentBorder ? -horizontalBlur.maximumRadius - 1 : 0
        y: rootItem.transparentBorder ? -horizontalBlur.maximumRadius - 1 : 0
        width: horizontalBlur.width + 2
        height: horizontalBlur.height + 2

        horizontalStep: 0.0
        verticalStep: 1.0 / parent.height

        source: ShaderEffectSource {
            sourceItem: horizontalBlur
            hideSource: true
            visible: false
            smooth: true
        }

        deviation: (radius + 1) / 2.3333
        radius: rootItem.radius
        maximumRadius: Math.ceil(rootItem.radius)
        transparentBorder: false
        visible: loops > 0
    }

    GaussianDirectionalBlur {
        id: horizontalBlur
        width: rootItem.transparentBorder ? parent.width + 2 * maximumRadius + 2 : parent.width
        height: rootItem.transparentBorder ? parent.height + 2 * maximumRadius + 2 : parent.height

        horizontalStep: 1.0 / parent.width
        verticalStep: 0.0

        source: recursiveSource
        deviation: (radius + 1) / 2.3333
        radius: rootItem.radius
        maximumRadius: Math.ceil(rootItem.radius)
        transparentBorder: false
        visible: false
    }
}
