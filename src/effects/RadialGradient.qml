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
    property bool cached: false
    property real horizontalOffset: 0.0
    property real verticalOffset: 0.0
    property real horizontalRadius: width
    property real verticalRadius: height
    property real angle: 0.0
    property variant source

    property Gradient gradient: Gradient {
        GradientStop { position: 0.0; color: "white" }
        GradientStop { position: 1.0; color: "black" }
    }

    SourceProxy {
        id: maskSourceProxy
        input: rootItem.source
    }

    ShaderEffectSource {
        id: gradientSource
        sourceItem: Rectangle {
            width: 16
            height: 256
            gradient: rootItem.gradient
            smooth: true
        }
        smooth: true
        hideSource: true
        visible: false
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
        property variant gradientImage: gradientSource
        property variant maskSource: maskSourceProxy.output
        property variant center: Qt.point(0.5 + rootItem.horizontalOffset / width, 0.5 + rootItem.verticalOffset / height)
        property real horizontalRatio: rootItem.horizontalRadius > 0 ? width / (2 * rootItem.horizontalRadius) : width * 16384
        property real verticalRatio: rootItem.verticalRadius > 0 ? height / (2 * rootItem.verticalRadius) : height * 16384
        property real angle: -rootItem.angle / 360 * 2 * Math.PI
        property variant matrixData: Qt.point(Math.sin(angle), Math.cos(angle))

        anchors.fill: parent

        vertexShader: "
            attribute highp vec4 qt_Vertex;
            attribute highp vec2 qt_MultiTexCoord0;
            uniform highp mat4 qt_Matrix;
            uniform highp vec2 matrixData;
            uniform highp float horizontalRatio;
            uniform highp float verticalRatio;
            uniform highp vec2 center;
            varying highp vec2 qt_TexCoord0;
            varying highp vec2 qt_TexCoord1;
            varying highp vec2 centerPoint;

            void main() {
                highp vec2 ratio = vec2(horizontalRatio, verticalRatio);

                // Rotation matrix
                highp mat2 rot = mat2(matrixData.y, -matrixData.x,
                                      matrixData.x,  matrixData.y);

                qt_TexCoord0 = qt_MultiTexCoord0;

                qt_TexCoord1 = qt_MultiTexCoord0;
                qt_TexCoord1 -= center;
                qt_TexCoord1 *= rot;
                qt_TexCoord1 += center;
                qt_TexCoord1 *= ratio;

                centerPoint = center * ratio;

                gl_Position = qt_Matrix * qt_Vertex;
            }
        "

        fragmentShader: maskSource == undefined ? noMaskShader : maskShader

        onFragmentShaderChanged: horizontalRatioChanged()

        property string maskShader: "
            uniform lowp sampler2D gradientImage;
            uniform lowp sampler2D maskSource;
            uniform lowp float qt_Opacity;
            varying highp vec2 qt_TexCoord0;
            varying highp vec2 qt_TexCoord1;
            varying highp vec2 centerPoint;

            void main() {
                lowp vec4 gradientColor = texture2D(gradientImage, vec2(0.0, 2.0 * distance(qt_TexCoord1, centerPoint)));
                lowp float maskAlpha = texture2D(maskSource, qt_TexCoord0).a;
                gl_FragColor = gradientColor * maskAlpha * qt_Opacity;
            }
        "

        property string noMaskShader: "
            uniform lowp sampler2D gradientImage;
            uniform lowp float qt_Opacity;
            varying highp vec2 qt_TexCoord1;
            varying highp vec2 centerPoint;

            void main() {
                lowp vec4 gradientColor = texture2D(gradientImage, vec2(0.0, 2.0 * distance(qt_TexCoord1, centerPoint)));
                gl_FragColor = gradientColor * qt_Opacity;
            }
        "
    }
}
