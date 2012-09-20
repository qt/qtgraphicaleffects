/*****************************************************************************
**
** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the Qt Add-On Graphical Effects module.
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
*****************************************************************************/

import QtQuick 2.0
import "private"

Item {
    id: rootItem
    property variant source
    property variant gamma: Qt.vector3d(1.0, 1.0, 1.0)
    property color minimumInput: Qt.rgba(0.0, 0.0, 0.0, 0.0)
    property color maximumInput: Qt.rgba(1.0, 1.0, 1.0, 1.0)
    property color minimumOutput: Qt.rgba(0.0, 0.0, 0.0, 0.0)
    property color maximumOutput: Qt.rgba(1.0, 1.0, 1.0, 1.0)
    property bool cached: false

    SourceProxy {
        id: sourceProxy
        input: rootItem.source
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
        property variant source: sourceProxy.output
        property variant minimumInputRGB: Qt.vector3d(rootItem.minimumInput.r, rootItem.minimumInput.g, rootItem.minimumInput.b)
        property variant maximumInputRGB: Qt.vector3d(rootItem.maximumInput.r, rootItem.maximumInput.g, rootItem.maximumInput.b)
        property real minimumInputAlpha: rootItem.minimumInput.a
        property real maximumInputAlpha: rootItem.maximumInput.a
        property variant minimumOutputRGB: Qt.vector3d(rootItem.minimumOutput.r, rootItem.minimumOutput.g, rootItem.minimumOutput.b)
        property variant maximumOutputRGB: Qt.vector3d(rootItem.maximumOutput.r, rootItem.maximumOutput.g, rootItem.maximumOutput.b)
        property real minimumOutputAlpha: rootItem.minimumOutput.a
        property real maximumOutputAlpha: rootItem.maximumOutput.a
        property variant gamma: Qt.vector3d(1.0 / Math.max(rootItem.gamma.x, 0.0001), 1.0 / Math.max(rootItem.gamma.y, 0.0001), 1.0 / Math.max(rootItem.gamma.z, 0.0001))
        anchors.fill: parent

        fragmentShader: "
            varying highp vec2 qt_TexCoord0;
            uniform highp float qt_Opacity;
            uniform lowp sampler2D source;
            uniform highp vec3 minimumInputRGB;
            uniform highp vec3 maximumInputRGB;
            uniform highp float minimumInputAlpha;
            uniform highp float maximumInputAlpha;
            uniform highp vec3 minimumOutputRGB;
            uniform highp vec3 maximumOutputRGB;
            uniform highp float minimumOutputAlpha;
            uniform highp float maximumOutputAlpha;
            uniform highp vec3 gamma;

            highp float linearstep(highp float e0, highp float e1, highp float x) {
                return clamp((x - e0) / (e1 - e0), 0.0, 1.0);
            }

            void main(void) {
                highp vec4 textureColor = texture2D(source, qt_TexCoord0.st);
                highp vec4 color = vec4(textureColor.rgb / max(1.0/256.0, textureColor.a), textureColor.a);

                color.r = linearstep(minimumInputRGB.r, maximumInputRGB.r, color.r);
                color.g = linearstep(minimumInputRGB.g, maximumInputRGB.g, color.g);
                color.b = linearstep(minimumInputRGB.b, maximumInputRGB.b, color.b);
                color.a = linearstep(minimumInputAlpha, maximumInputAlpha, color.a);

                color.rgb = pow(color.rgb, gamma);

                color.r = minimumOutputRGB.r + color.r * (maximumOutputRGB.r - minimumOutputRGB.r);
                color.g = minimumOutputRGB.g + color.g * (maximumOutputRGB.g - minimumOutputRGB.g);
                color.b = minimumOutputRGB.b + color.b * (maximumOutputRGB.b - minimumOutputRGB.b);
                color.a = minimumOutputAlpha + color.a * (maximumOutputAlpha - minimumOutputAlpha);

                gl_FragColor = vec4(color.rgb * color.a, color.a) * qt_Opacity;
            }
        "
    }
}
