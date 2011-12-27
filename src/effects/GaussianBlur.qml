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
    property variant source
    property real radius: 0.0
    property int maximumRadius: 0
    property real deviation: (radius + 1) / 3.3333
    property bool transparentBorder: false
    property bool cached: false

    SourceProxy {
        id: sourceProxy
        input: rootItem.source
    }

    ShaderEffectSource {
        id: cacheItem
        anchors.fill: verticalBlur
        visible: rootItem.cached
        smooth: true
        sourceItem: verticalBlur
        live: true
        hideSource: visible
    }

    DirectionalGaussianBlur {
        id: verticalBlur
        x: transparentBorder ? -maximumRadius : 0
        y: transparentBorder ? -maximumRadius : 0
        width: horizontalBlur.width
        height: transparentBorder ? horizontalBlur.height + 2 * maximumRadius : horizontalBlur.height

        horizontalStep: 0.0
        verticalStep: 1.0 / parent.height

        source: ShaderEffectSource {
            sourceItem: horizontalBlur
            hideSource: true
            visible: false
            smooth: true
        }

        deviation: rootItem.deviation
        radius: rootItem.radius
        maximumRadius: rootItem.maximumRadius
        transparentBorder: rootItem.transparentBorder
    }

    DirectionalGaussianBlur {
        id: horizontalBlur
        width: transparentBorder ? parent.width + 2 * maximumRadius : parent.width
        height: parent.height

        horizontalStep: 1.0 / parent.width
        verticalStep: 0.0

        source: sourceProxy.output
        deviation: rootItem.deviation
        radius: rootItem.radius
        maximumRadius: rootItem.maximumRadius
        transparentBorder: rootItem.transparentBorder
    }
}
