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
    property variant start: Qt.point(0, 0)
    property variant end: Qt.point(0, height)
    property bool cached: false
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

        anchors.fill: parent

        property variant source: gradientSource
        property variant maskSource: maskSourceProxy.output
        property variant startPoint: Qt.point(start.x / width, start.y / height)
        property real dx: end.x - start.x
        property real dy: end.y - start.y
        property real l: 1.0 / Math.sqrt(Math.pow(dx / width, 2.0) + Math.pow(dy / height, 2.0))
        property real angle: Math.atan2(dx, dy)
        property variant matrixData: Qt.point(Math.sin(angle), Math.cos(angle))

        vertexShader: "
            attribute highp vec4 qt_Vertex;
            attribute highp vec2 qt_MultiTexCoord0;
            uniform highp mat4 qt_Matrix;
            varying highp vec2 qt_TexCoord0;
            varying highp vec2 qt_TexCoord1;
            uniform highp vec2 startPoint;
            uniform highp float l;
            uniform highp vec2 matrixData;

            void main() {
                highp mat2 rot = mat2(matrixData.y, -matrixData.x,
                                      matrixData.x,  matrixData.y);

                qt_TexCoord0 = qt_MultiTexCoord0;

                qt_TexCoord1 = qt_MultiTexCoord0 * l;
                qt_TexCoord1 -= startPoint * l;
                qt_TexCoord1 *= rot;

                gl_Position = qt_Matrix * qt_Vertex;
            }
        "

        fragmentShader: maskSource == undefined ? noMaskShader : maskShader

        onFragmentShaderChanged: lChanged()

        property string maskShader: "
            uniform lowp sampler2D source;
            uniform lowp sampler2D maskSource;
            uniform lowp float qt_Opacity;
            varying highp vec2 qt_TexCoord0;
            varying highp vec2 qt_TexCoord1;

            void main() {
                lowp vec4 gradientColor = texture2D(source, qt_TexCoord1);
                lowp float maskAlpha = texture2D(maskSource, qt_TexCoord0).a;
                gl_FragColor = gradientColor * maskAlpha * qt_Opacity;
            }
        "

        property string noMaskShader: "
            uniform lowp sampler2D source;
            uniform lowp float qt_Opacity;
            varying highp vec2 qt_TexCoord1;

            void main() {
                gl_FragColor = texture2D(source, qt_TexCoord1) * qt_Opacity;
            }
        "
    }
}
