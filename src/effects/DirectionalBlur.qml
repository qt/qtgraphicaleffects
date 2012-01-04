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
    property real length: 0.0
    property int samples: 0
    property real angle: 0.0
    property bool transparentBorder: false
    property bool cached: false

    SourceProxy {
        id: sourceProxy
        input: rootItem.source
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
        property real len: rootItem.length
        property bool transparentBorder: rootItem.transparentBorder
        property real samples: rootItem.samples
        property real weight: 1 / rootItem.samples
        property variant expandPixels: transparentBorder ? Qt.size(rootItem.samples, rootItem.samples) : Qt.size(0,0)
        property variant expand: transparentBorder ? Qt.size(expandPixels.width / width, expandPixels.height / height) : Qt.size(0,0)
        property variant pixelSize: Qt.size(1.0 / (width / (1.0 - 2 * expand.width)), 1.0 / (height / (1.0 - 2 * expand.height)))
        property variant delta: Qt.size(1.0 / rootItem.width * Math.cos((rootItem.angle + 90) * Math.PI/180), 1.0 / rootItem.height * Math.sin((rootItem.angle + 90) * Math.PI/180))

        x: transparentBorder ? -expandPixels.width : 0
        y: transparentBorder ? -expandPixels.height : 0
        width: transparentBorder ? parent.width + 2.0 * expandPixels.width : parent.width
        height: transparentBorder ? parent.height + 2.0 * expandPixels.height : parent.height


        property string fragmentShaderSkeleton: "
            varying highp vec2 qt_TexCoord0;
            uniform highp float qt_Opacity;
            uniform sampler2D source;
            uniform highp float len;
            uniform highp float samples;
            uniform highp float weight;
            uniform highp vec2 expand;
            uniform highp vec2 pixelSize;
            uniform highp vec2 delta;

            highp float linearstep(highp float e0, highp float e1, highp float x) {
                return clamp((x - e0) / (e1 - e0), 0.0, 1.0);
            }

            void main(void) {
                highp vec2 shift = vec2(delta.x, delta.y) * len / max(1.0, samples - 1.0);
                mediump vec2 texCoord = qt_TexCoord0;
                gl_FragColor = vec4(0.0);

                PLACEHOLDER_EXPAND_STEPS

                texCoord -= shift * max(0.0, samples - 1.0) * 0.5;

                PLACEHOLDER_UNROLLED_LOOP

                gl_FragColor *= qt_Opacity;
           }
        "

        function buildFragmentShader() {
            var shader = fragmentShaderSkeleton
            var expandSteps = ""
            var linearSteps = ""

            if (transparentBorder) {
                expandSteps += "texCoord.s = (texCoord.s - expand.x) / (1.0 - 2.0 * expand.x);"
                expandSteps += "texCoord.t = (texCoord.t - expand.y) / (1.0 - 2.0 * expand.y);"
                expandSteps += "highp vec2 stepSize = vec2(1.0 - pixelSize.x, 1.0 - pixelSize.y);"
                linearSteps = "* linearstep(0.0, pixelSize.x, texCoord.s) * linearstep(1.0, stepSize.x, texCoord.s) * linearstep(0.0, pixelSize.y, texCoord.t) * linearstep(1.0, stepSize.y, texCoord.t)"
            }

            var unrolledLoop = "gl_FragColor += texture2D(source, texCoord) " + linearSteps + ";\n"

            if (rootItem.samples > 1) {
                unrolledLoop = ""
                for (var i = 0; i < rootItem.samples; i++)
                    unrolledLoop += "gl_FragColor += texture2D(source, texCoord) * weight " + linearSteps + "; texCoord += shift;\n"
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
