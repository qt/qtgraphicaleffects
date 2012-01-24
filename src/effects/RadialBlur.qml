/****************************************************************************
**
** Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
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
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0
import "internal"

Item {
    id: rootItem
    property variant source
    property real angle: 0.0
    property int samples: 0
    property real horizontalOffset: 0.0
    property real verticalOffset: 0.0
    property bool transparentBorder: false
    property bool cached: false

    SourceProxy {
        id: sourceProxy
        input: rootItem.source
        sourceRect: shaderItem.transparentBorder ? Qt.rect(-1, -1, parent.width + 2.0, parent.height + 2.0) : Qt.rect(0, 0, 0, 0)
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
        property variant center: Qt.point(0.5 + rootItem.horizontalOffset / parent.width, 0.5 + rootItem.verticalOffset / parent.height)
        property bool transparentBorder: rootItem.transparentBorder && rootItem.samples > 1
        property int samples: rootItem.samples
        property real weight: 1.0 / Math.max(1.0, rootItem.samples)
        property real angleSinStep: Math.sin(-rootItem.angle * Math.PI/180 / Math.max(1.0, rootItem.samples - 1))
        property real angleCosStep: Math.cos(-rootItem.angle * Math.PI/180 / Math.max(1.0, rootItem.samples - 1))
        property variant expandPixels: transparentBorder ? Qt.size(0.5 * parent.height, 0.5 * parent.width) : Qt.size(0,0)
        property variant expand: transparentBorder ? Qt.size(expandPixels.width / width, expandPixels.height / height) : Qt.size(0,0)
        property variant delta: Qt.size(1.0 / rootItem.width, 1.0 / rootItem.height)
        property real w: parent.width
        property real h: parent.height

        x: transparentBorder ? -expandPixels.width - 1 : 0
        y: transparentBorder ? -expandPixels.height - 1 : 0
        width: transparentBorder ? parent.width + expandPixels.width * 2.0 + 2 : parent.width
        height: transparentBorder ? parent.height + expandPixels.height * 2.0 + 2 : parent.height

        property string fragmentShaderSkeleton: "
            varying highp vec2 qt_TexCoord0;
            uniform highp float qt_Opacity;
            uniform sampler2D source;
            uniform highp float angleSinStep;
            uniform highp float angleCosStep;
            uniform highp float weight;
            uniform highp vec2 expand;
            uniform highp vec2 center;
            uniform highp vec2 delta;
            uniform highp float w;
            uniform highp float h;

            void main(void) {
                highp mat2 m;
                m[0] = vec2(angleCosStep, -angleSinStep);
                m[1] = vec2(angleSinStep, angleCosStep);
                gl_FragColor = vec4(0.0);
                mediump vec2 texCoord = qt_TexCoord0;

                PLACEHOLDER_EXPAND_STEPS

                highp vec2 dir = vec2(texCoord.s * w - w * 0.5, texCoord.t * h - h * 0.5);

                PLACEHOLDER_UNROLLED_LOOP

                gl_FragColor *= qt_Opacity;
            }
        "

        function buildFragmentShader() {
            var shader = fragmentShaderSkeleton
            var expandSteps = ""

            if (transparentBorder) {
                expandSteps += "texCoord.s = (texCoord.s - expand.x) / (1.0 - 2.0 * expand.x);"
                expandSteps += "texCoord.t = (texCoord.t - expand.y) / (1.0 - 2.0 * expand.y);"
            }

            var unrolledLoop = "gl_FragColor += texture2D(source, texCoord);\n"

            if (rootItem.samples > 1) {
                 unrolledLoop = ""
                 for (var i = 0; i < rootItem.samples; i++)
                     unrolledLoop += "texCoord = vec2(center.x + dir.x * delta.x, center.y + dir.y * delta.y); gl_FragColor += texture2D(source, texCoord) * weight; dir *= m;\n"
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
