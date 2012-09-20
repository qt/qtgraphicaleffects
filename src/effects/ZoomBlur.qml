/****************************************************************************
**
** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
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
**   * Neither the name of Digia Plc and its Subsidiary(-ies) nor the names
**     of its contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
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
    property real length: 0.0
    property int samples: 0
    property real horizontalOffset: 0.0
    property real verticalOffset: 0.0
    property bool transparentBorder: false
    property bool cached: false

    SourceProxy {
        id: sourceProxy
        input: rootItem.source
        sourceRect: rootItem.transparentBorder ? Qt.rect(-1, -1, parent.width + 2.0, parent.height + 2.0) : Qt.rect(0, 0, 0, 0)
    }

    ShaderEffectSource {
        id: cacheItem
        anchors.fill: shaderItem
        visible: rootItem.cached
        smooth: true
        sourceItem: shaderItem
        live: true
        hideSource: visible
    }

    ShaderEffect {
        id: shaderItem
        property variant source: sourceProxy.output
        property variant center: Qt.point(0.5 + rootItem.horizontalOffset / width, 0.5 + rootItem.verticalOffset / height)
        property real len: rootItem.length
        property bool transparentBorder: rootItem.transparentBorder
        property real samples: rootItem.samples
        property real weight: 1.0 / Math.max(1.0, rootItem.samples)
        property variant expandPixels: transparentBorder ? Qt.size(rootItem.samples, rootItem.samples) : Qt.size(0,0)
        property variant expand: transparentBorder ? Qt.size(expandPixels.width / width, expandPixels.height / height) : Qt.size(0,0)
        property variant delta: Qt.size(1.0 / rootItem.width, 1.0 / rootItem.height)

        x: transparentBorder ? -expandPixels.width - 1 : 0
        y: transparentBorder ? -expandPixels.height - 1 : 0
        width: transparentBorder ? parent.width + 2.0 * expandPixels.width + 2 : parent.width
        height: transparentBorder ? parent.height + 2.0 * expandPixels.height + 2 : parent.height

        property string fragmentShaderSkeleton: "
            varying highp vec2 qt_TexCoord0;
            uniform highp float qt_Opacity;
            uniform lowp sampler2D source;
            uniform highp float len;
            uniform highp float weight;
            uniform highp float samples;
            uniform highp vec2 center;
            uniform highp vec2 expand;
            uniform highp vec2 delta;

            void main(void) {
                mediump vec2 texCoord = qt_TexCoord0;
                mediump vec2 centerCoord = center;

                PLACEHOLDER_EXPAND_STEPS

                highp vec2 dir = vec2(centerCoord.x - texCoord.s, centerCoord.y - texCoord.t);
                dir /= max(1.0, length(dir) * 2.0);
                highp vec2 shift = delta * len * dir * 2.0 / max(1.0, samples - 1.0);
                gl_FragColor = vec4(0.0);

                PLACEHOLDER_UNROLLED_LOOP

                gl_FragColor *= weight * qt_Opacity;
            }
        "

        function buildFragmentShader() {
            var shader = fragmentShaderSkeleton
            var expandSteps = ""

            if (transparentBorder) {
                expandSteps += "centerCoord = (centerCoord - expand) / (1.0 - 2.0 * expand);"
                expandSteps += "texCoord = (texCoord - expand) / (1.0 - 2.0 * expand);"
             }

             var unrolledLoop = "gl_FragColor += texture2D(source, texCoord);\n"

             if (rootItem.samples > 1) {
                 unrolledLoop = ""
                 for (var i = 0; i < rootItem.samples; i++)
                      unrolledLoop += "gl_FragColor += texture2D(source, texCoord); texCoord += shift;\n"
             }

             shader = shader.replace("PLACEHOLDER_EXPAND_STEPS", expandSteps)
             fragmentShader = shader.replace("PLACEHOLDER_UNROLLED_LOOP", unrolledLoop)
        }

        onFragmentShaderChanged: sourceChanged()
        onSamplesChanged: buildFragmentShader()
        onTransparentBorderChanged: buildFragmentShader()
        Component.onCompleted: buildFragmentShader()
    }
}
