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
****************************************************************************/

import QtQuick 2.0
import QtGraphicalEffects 1.0

VisualItemModel {

    MaskedBlur {
        width: size
        height: size
        source: butterfly
        maskSource: blurMask
        samples: 24
        property string __name: "MaskedBlur"
        property variant __properties: ["radius", "samples", "transparentBorder", "fast"]
        property string __varyingProperty: "radius"
        property variant __values: [0.0, 8.0, 16.0]
    }
    MaskedBlur {
        width: size
        height: size
        source: butterfly
        maskSource: blurMask
        radius: 16
        samples: 24
        property string __name: "MaskedBlur"
        property variant __properties: ["radius", "samples", "transparentBorder", "fast"]
        property string __varyingProperty: "fast"
        property variant __values: [false, true]
    }
    MaskedBlur {
        function init() { checkerboard = true }
        width: size
        height: size
        source: bug
        maskSource: blurMask
        radius: 64
        samples: 24
        fast: true
        property string __name: "MaskedBlur"
        property variant __properties: ["radius", "samples", "transparentBorder", "fast"]
        property string __varyingProperty: "transparentBorder"
        property variant __values: [false, true]
        function uninit() { checkerboard = false }
    }

    Item {
        id: theEnd
        width: size
        height: size
        function init() { Qt.quit() }
    }
}
