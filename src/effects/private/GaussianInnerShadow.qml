/****************************************************************************
**
** Copyright (C) 2021 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt Graphical Effects module.
**
** $QT_BEGIN_LICENSE:COMM$
**
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** $QT_END_LICENSE$
**
**
**
**
**
**
**
**
**
**
**
**
**
**
**
**
**
**
**
****************************************************************************/

import QtQuick 2.12
import QtGraphicalEffects.private 1.12

Item {
    id: rootItem
    property variant source
    property real radius: 0.0
    property int maximumRadius: 0
    property real horizontalOffset: 0
    property real verticalOffset: 0
    property real spread: 0
    property color color: "black"
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

    ShaderEffect{
        id: shadowItem
        anchors.fill: parent

        property variant original: sourceProxy.output
        property color color: rootItem.color
        property real horizontalOffset: rootItem.horizontalOffset / rootItem.width
        property real verticalOffset: rootItem.verticalOffset / rootItem.height

        visible: false
        fragmentShader: "qrc:/qt-project.org/imports/QtGraphicalEffects/shaders/gaussianinnershadow_shadow.frag"
    }

    GaussianDirectionalBlur {
        id: blurItem
        anchors.fill: parent
        horizontalStep: 0.0
        verticalStep: 1.0 / parent.height
        source: horizontalBlur
        radius: rootItem.radius
        maximumRadius: rootItem.maximumRadius
        visible: false
    }

    GaussianDirectionalBlur {
        id: horizontalBlur
        width: transparentBorder ? parent.width + 2 * maximumRadius : parent.width
        height: parent.height
        horizontalStep: 1.0 / parent.width
        verticalStep: 0.0
        source: shadowItem
        radius: rootItem.radius
        maximumRadius: rootItem.maximumRadius
        visible: false
    }

    ShaderEffectSource {
        id: blurredSource
        sourceItem: blurItem
        live: true
        smooth: true
    }

    ShaderEffect {
        id: shaderItem
        anchors.fill: parent

        property variant original: sourceProxy.output
        property variant shadow: blurredSource
        property real spread: 1.0 - (rootItem.spread * 0.98)
        property color color: rootItem.color

        fragmentShader: "qrc:/qt-project.org/imports/QtGraphicalEffects/shaders/gaussianinnershadow.frag"
    }
}
