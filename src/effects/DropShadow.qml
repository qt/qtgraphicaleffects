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
    property int samples: 0
    property color color: "black"
    property real horizontalOffset: 0.0
    property real verticalOffset: 0.0
    property real spread: 0.0
    property bool fast: false
    property bool cached: false
    property bool transparentBorder: false

    Loader {
        x: rootItem.horizontalOffset
        y: rootItem.verticalOffset
        width: parent.width
        height: parent.height
        sourceComponent: rootItem.fast ? fastGlow : gaussianGlow
    }

    Component {
        id: gaussianGlow
        GaussianGlow {
            anchors.fill: parent
            source: sourceProxy.output
            radius: rootItem.radius
            maximumRadius: rootItem.samples * 0.5
            color: rootItem.color
            cached: rootItem.cached
            spread: rootItem.spread
            transparentBorder: rootItem.transparentBorder
        }
    }

    Component {
        id: fastGlow
        FastGlow {
            anchors.fill: parent
            source: sourceProxy.output
            blur: Math.pow(rootItem.radius / 64.0, 0.4)
            color: rootItem.color
            cached: rootItem.cached
            spread: rootItem.spread
            transparentBorder: rootItem.transparentBorder
        }
    }

    SourceProxy {
        id: sourceProxy
        input: rootItem.source
    }
    ShaderEffect {
        anchors.fill: parent
        property variant source: sourceProxy.output
    }
}
