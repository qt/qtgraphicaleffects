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

Item {
    id: rootItem
    property variant backgroundSource
    property variant foregroundSource
    property string mode: "normal"
    property bool cached: false

    SourceProxy {
        id: backgroundSourceProxy
        input: rootItem.backgroundSource
    }

    SourceProxy {
        id: foregroundSourceProxy
        input: rootItem.foregroundSource
    }

    ShaderEffectSource {
        id: cacheItem
        anchors.fill: parent
        visible: rootItem.cached
        smooth: true
        sourceItem: shaderItem
        live: true
        hideSource: visible
    }

    ShaderEffect {
        id: shaderItem
        property variant backgroundSource: backgroundSourceProxy.output
        property variant foregroundSource: foregroundSourceProxy.output
        property string mode: rootItem.mode
        anchors.fill: parent

        fragmentShader: fragmentShaderBegin + blendModeNormal + fragmentShaderEnd

        function buildFragmentShader() {
            var shader = fragmentShaderBegin

            switch (mode) {
                case "darken" : shader += blendModeDarken; break;
                case "addition" : shader += blendModeAddition; break;
                case "difference" : shader += blendModeDifference; break;
                case "divide" : shader += blendModeDivide; break;
                case "lighten" : shader += blendModeLighten; break;
                case "normal" : shader += blendModeNormal; break;
                case "multiply" : shader += blendModeMultiply; break;
                case "screen" : shader += blendModeScreen; break;
                case "subtract" : shader += blendModeSubtract; break;
                default: shader += "gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);"; break;
            }

            shader += fragmentShaderEnd
            fragmentShader = shader

            // Workaraound for a bug just to make sure display gets updated when the mode changes.
            backgroundSourceChanged()
        }

        Component.onCompleted: {
            buildFragmentShader()
        }

        onModeChanged: {
            buildFragmentShader()
        }

        property string blendModeAddition: "result.rgb = min(rgb1 + rgb2, 1.0);"
        property string blendModeDarken: "result.rgb = min(rgb1, rgb2);"
        property string blendModeDifference: "result.rgb = abs(rgb1 - rgb2);"
        property string blendModeDivide: "result.rgb = clamp(rgb1 / rgb2, 0.0, 1.0);"
        property string blendModeLighten: "result.rgb = max(rgb1, rgb2);"
        property string blendModeMultiply: "result.rgb = rgb1 * rgb2;"
        property string blendModeNormal: "result.rgb = rgb2;"
        property string blendModeScreen: "result.rgb = 1.0 - (vec3(1.0) - rgb1) * (vec3(1.0) - rgb2);"
        property string blendModeSubtract: "result.rgb = max(rgb1 - rgb2, vec3(0.0));"

        property string fragmentShaderBegin: "
            varying mediump vec2 qt_TexCoord0;
            uniform highp float qt_Opacity;
            uniform sampler2D backgroundSource;
            uniform sampler2D foregroundSource;
            void main() {
                lowp vec4 result = vec4(0.0);
                lowp vec4 color1 = texture2D(backgroundSource, qt_TexCoord0);
                lowp vec4 color2 = texture2D(foregroundSource, qt_TexCoord0);
                lowp vec3 rgb1 = color1.rgb / max(1.0/256.0, color1.a);
                lowp vec3 rgb2 = color2.rgb / max(1.0/256.0, color2.a);
        "

        property string fragmentShaderEnd: "
                gl_FragColor.a = color1.a * qt_Opacity;
                gl_FragColor.rgb = mix(rgb1, result.rgb, color2.a);
            }
        "
    }
}
