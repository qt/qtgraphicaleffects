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
import QtGraphicalEffects 0.1

VisualItemModel {
    Blend {
        width: size
        height: size
        backgroundSource: bug
        foregroundSource: butterfly
        mode: "normal"
        property string __name: "Blend"
        property variant __properties: ["mode"]
        property string __varyingProperty: "mode"
        property variant __values: ["normal", "addition","average", "color", "colorBurn","colorDodge", "darken", "darkerColor", "difference", "divide",
           "exclusion", "hardlight", "hue", "lighten", "lighterColor", "lightness", "negation", "multiply", "saturation", "screen", "subtract", "softLight"]
    }

    BrightnessContrast {
        width: size
        height: size
        source: bug
        property string __name: "BrightnessContrast"
        property variant __properties: ["brightness", "contrast"]
        property string __varyingProperty: "brightness"
        property variant __values: [-0.25, 0.0, 0.5]
    }
    BrightnessContrast {
        width: size
        height: size
        source: bug
        property string __name: "BrightnessContrast"
        property variant __properties: ["brightness", "contrast"]
        property string __varyingProperty: "contrast"
        property variant __values: [-0.5, 0.0, 0.5]
    }

    Colorize {
        width: size
        height: size
        source: bug
        property string __name: "Colorize"
        property variant __properties: ["hue", "saturation", "lightness"]
        property string __varyingProperty: "hue"
        property variant __values: [0.2, 0.5, 0.8]
    }
    Colorize {
        width: size
        height: size
        source: bug
        property string __name: "Colorize"
        property variant __properties: ["hue", "saturation", "lightness"]
        property string __varyingProperty: "saturation"
        property variant __values: [0.0, 0.5, 1.0]
    }
    Colorize {
        width: size
        height: size
        source: bug
        property string __name: "Colorize"
        property variant __properties: ["hue", "saturation", "lightness"]
        property string __varyingProperty: "lightness"
        property variant __values: [-0.75, 0.0, 0.75]
    }

    ColorOverlay {
        width: size
        height: size
        source: bug
        property string __name: "ColorOverlay"
        property variant __properties: ["color"]
        property string __varyingProperty: "color"
        property variant __values: ["#80ff0000", "#8000ff00", "#800000ff"]
    }

    ConicalGradient {
        function init() { checkerboard = true }

        width: size
        height: size
        property string __name: "ConicalGradient"
        property variant __properties: ["angle", "horizontalOffset", "verticalOffset", "gradient"]
        property string __varyingProperty: "angle"
        property variant __values: [0, 45, 185]
    }
    ConicalGradient {
        width: size
        height: size
        property string __name: "ConicalGradient"
        property variant __properties: ["angle", "horizontalOffset", "verticalOffset", "gradient"]
        property string __varyingProperty: "horizontalOffset"
        property variant __values: [-50, 0, 50]
    }
    ConicalGradient {
        width: size
        height: size
        property string __name: "ConicalGradient"
        property variant __properties: ["angle", "horizontalOffset", "verticalOffset", "gradient"]
        property string __varyingProperty: "gradient"
        property variant __values: [firstGradient, secondGradient, thirdGradient]
    }
    ConicalGradient {
        width: size
        height: size
        property string __name: "ConicalGradient"
        property variant __properties: ["angle", "horizontalOffset", "verticalOffset", "gradient", "maskSource"]
        property string __varyingProperty: "maskSource"
        property variant __values: [undefined, butterfly]

        function uninit() { checkerboard = false }
    }

    Desaturate {
        width: size
        height: size
        source: butterfly
        property string __name: "Desaturate"
        property variant __properties: ["desaturation"]
        property string __varyingProperty: "desaturation"
        property variant __values: ["0.0", "0.5", "1.0"]
    }

    // TODO: Update the displacement texture
    Displace {
        width: size
        height: size
        source: bug
        displacementSource: ShaderEffectSource {sourceItem: displacementMapSource; visible: false }
        property string __name: "Displace"
        property variant __properties: ["displacement"]
        property string __varyingProperty: "displacement"
        property variant __values: ["-0.3", "0.0", "0.3"]
    }

    DropShadow {
        function init() { butterfly.visible = true }

        width: size
        height: size
        source: butterfly
        horizontalOffset: 0
        verticalOffset: 20
        maximumRadius: 8
        property string __name: "DropShadow"
        property variant __properties: ["radius", "maximumRadius", "color", "horizontalOffset", "verticalOffset", "spread"]
        property string __varyingProperty: "radius"
        property variant __values: [0, 6, 12]
    }
    DropShadow {
        function init() { checkerboard = true }
        width: size
        height: size
        source: butterfly
        horizontalOffset: 0
        verticalOffset: 20
        radius: 8
        maximumRadius: 8
        property string __name: "DropShadow"
        property variant __properties: ["radius", "maximumRadius", "color", "horizontalOffset", "verticalOffset", "spread"]
        property string __varyingProperty: "color"
        property variant __values: ["#000000", "#0000ff", "#aa000000"]

        function uninit() { checkerboard = false }
    }
    DropShadow {
        width: size
        height: size
        source: butterfly
        //verticalOffset: 3
        radius: 4
        maximumRadius: 8
        property string __name: "DropShadow"
        property variant __properties: ["radius", "maximumRadius", "color", "horizontalOffset", "verticalOffset", "spread"]
        property string __varyingProperty: "horizontalOffset"
        property variant __values: ["-20", "0", "20"]
    }
    DropShadow {
        width: size
        height: size
        source: butterfly
        //horizontalOffset: 3
        radius: 4
        maximumRadius: 8
        property string __name: "DropShadow"
        property variant __properties: ["radius", "maximumRadius", "color", "horizontalOffset", "verticalOffset", "spread"]
        property string __varyingProperty: "verticalOffset"
        property variant __values: ["-20", "0", "20"]
    }
    DropShadow {
        width: size
        height: size
        source: butterfly
        //horizontalOffset: 3
        verticalOffset: 20
        radius: 8
        maximumRadius: 8
        property string __name: "DropShadow"
        property variant __properties: ["radius", "maximumRadius", "color", "horizontalOffset", "verticalOffset", "spread"]
        property string __varyingProperty: "spread"
        property variant __values: ["0.0", "0.5", "1.0"]
    }
    DropShadow {
        width: size
        height: size
        source: butterfly
        //horizontalOffset: 3
        verticalOffset: 20
        radius: 16
        maximumRadius: 16
        property string __name: "DropShadow"
        property variant __properties: ["radius", "maximumRadius", "color", "horizontalOffset", "verticalOffset", "spread", "fast"]
        property string __varyingProperty: "fast"
        property variant __values: [false, true]
    }
    Glow {
        function init() { background = "black" }

        width: size
        height: size
        source: butterfly
        maximumRadius: 8
        property string __name: "Glow"
        property variant __properties: ["radius", "maximumRadius", "color", "spread"]
        property string __varyingProperty: "radius"
        property variant __values: [0, 6, 12]
    }
    Glow {
        width: size
        height: size
        source: butterfly
        radius: 8
        spread: 0.5
        maximumRadius: 8
        property string __name: "Glow"
        property variant __properties: ["radius", "maximumRadius", "color", "spread"]
        property string __varyingProperty: "color"
        property variant __values: ["#ffffff", "#00ff00", "#aa00ff00"]
    }
    Glow {
        width: size
        height: size
        source: butterfly
        radius: 8
        maximumRadius: 8
        property string __name: "Glow"
        property variant __properties: ["radius", "maximumRadius", "color", "spread"]
        property string __varyingProperty: "spread"
        property variant __values: ["0.0", "0.5", "1.0"]
    }
    Glow {
        width: size
        height: size
        source: butterfly
        radius: 16
        maximumRadius: 16
        spread: 0.3
        property string __name: "Glow"
        property variant __properties: ["radius", "maximumRadius", "color", "spread", "fast"]
        property string __varyingProperty: "fast"
        property variant __values: [false, true]

        function uninit() { butterfly.visible = false }
    }

    FastBlur {
        width: size
        height: size
        source: bug
        property string __name: "FastBlur"
        property variant __properties: ["blur"]
        property string __varyingProperty: "blur"
        property variant __values: ["0.0", "0.5", "1.0"]
    }
    FastBlur {
        function init() { checkerboard = true }
        width: size
        height: size
        source: bug
        blur: 1.0
        property string __name: "FastBlur"
        property variant __properties: ["blur", "transparentBorder"]
        property string __varyingProperty: "transparentBorder"
        property variant __values: [false, true]
        function uninit() { checkerboard = false }
    }

    GammaAdjust {
        width: size
        height: size
        source: bug
        property string __name: "GammaAdjust"
        property variant __properties: ["gamma"]
        property string __varyingProperty: "gamma"
        property variant __values: ["0.5", "1.0", "2.0"]
    }

    GaussianBlur {
        width: size
        height: size
        source: bug
        maximumRadius: 8
        deviation: 3
        property string __name: "GaussianBlur"
        property variant __properties: ["radius", "maximumRadius", "deviation"]
        property string __varyingProperty: "radius"
        property variant __values: [0, 4, 8]
    }
    GaussianBlur {
        width: size
        height: size
        source: bug
        maximumRadius: 8
        radius: 8
        property string __name: "GaussianBlur"
        property variant __properties: ["radius", "maximumRadius", "deviation"]
        property string __varyingProperty: "deviation"
        property variant __values: [1, 2, 4]
    }
    GaussianBlur {
        function init() { checkerboard = true }
        width: size
        height: size
        source: bug
        maximumRadius: 8
        radius: 8
        property string __name: "GaussianBlur"
        property variant __properties: ["radius", "maximumRadius", "deviation", "transparentBorder"]
        property string __varyingProperty: "transparentBorder"
        property variant __values: [false, true]
        function uninit() { checkerboard = false }
    }

    HueSaturation {
        width: size
        height: size
        source: bug
        property string __name: "HueSaturation"
        property variant __properties: ["hue", "saturation", "lightness"]
        property string __varyingProperty: "hue"
        property variant __values: ["-0.3", "0.0", "0.3"]
    }
    HueSaturation {
        width: size
        height: size
        source: bug
        property string __name: "HueSaturation"
        property variant __properties: ["hue", "saturation", "lightness"]
        property string __varyingProperty: "saturation"
        property variant __values: ["-0.8", "0.0", "1.0"]
    }
    HueSaturation {
        width: size
        height: size
        source: bug
        property string __name: "HueSaturation"
        property variant __properties: ["hue", "saturation", "lightness"]
        property string __varyingProperty: "lightness"
        property variant __values: ["-0.5", "0.0", "0.5"]
    }

    InnerShadow {
        function init() {
            background = "white"
        }
        width: size
        height: size
        source: butterfly
        horizontalOffset: 0
        verticalOffset: 0
        maximumRadius: 16
        property string __name: "InnerShadow"
        property variant __properties: ["radius", "maximumRadius", "color", "horizontalOffset", "verticalOffset", "spread"]
        property string __varyingProperty: "radius"
        property variant __values: [0, 6, 12]
    }
    InnerShadow {
        width: size
        height: size
        source: butterfly
        horizontalOffset: 0
        verticalOffset: 0
        radius: 16
        maximumRadius: 16
        property string __name: "InnerShadow"
        property variant __properties: ["radius", "maximumRadius", "color", "horizontalOffset", "verticalOffset", "spread"]
        property string __varyingProperty: "horizontalOffset"
        property variant __values: [-20, 0, 20]
    }
    InnerShadow {
        width: size
        height: size
        source: butterfly
        horizontalOffset: 0
        verticalOffset: 0
        radius: 16
        maximumRadius: 16
        property string __name: "InnerShadow"
        property variant __properties: ["radius", "maximumRadius", "color", "horizontalOffset", "verticalOffset", "spread"]
        property string __varyingProperty: "spread"
        property variant __values: ["0.0", "0.3", "0.5"]
    }

    InnerShadow {
        width: size
        height: size
        source: butterfly
        horizontalOffset: 0
        verticalOffset: 0
        radius: 16
        spread: 0.2
        maximumRadius: 16
        property string __name: "InnerShadow"
        property variant __properties: ["radius", "maximumRadius", "color", "horizontalOffset", "verticalOffset", "spread", "fast"]
        property string __varyingProperty: "fast"
        property variant __values: [false, true]
    }

    InnerShadow {
        function init() { checkerboard = true }
        width: size
        height: size
        source: butterfly
        horizontalOffset: 0
        verticalOffset: 0
        radius: 16
        spread: 0.2
        maximumRadius: 16
        property string __name: "InnerShadow"
        property variant __properties: ["radius", "maximumRadius", "color", "horizontalOffset", "verticalOffset", "spread"]
        property string __varyingProperty: "color"
        property variant __values: ["#000000", "#ffffff", "#ff0000"]
    }

    LinearGradient {
        function init() { checkerboard = true }

        width: size
        height: size
        start: Qt.point(0,0)
        end: Qt.point(width, height)
        property string __name: "LinearGradient"
        property variant __properties: ["start", "end", "gradient"]
        property string __varyingProperty: "gradient"
        property variant __values: [firstGradient, secondGradient, thirdGradient]
    }
    LinearGradient {
        width: size
        height: size
        end: Qt.point(width, height)
        property string __name: "LinearGradient"
        property variant __properties: ["start", "end", "gradient"]
        property string __varyingProperty: "start"
        property variant __values: [Qt.point(0,0), Qt.point(width / 2, height / 2), Qt.point(width, 0)]
    }
    LinearGradient {
        width: size
        height: size
        start: Qt.point(0,0)
        property string __name: "LinearGradient"
        property variant __properties: ["start", "end", "gradient"]
        property string __varyingProperty: "end"
        property variant __values: [Qt.point(width, height), Qt.point(width / 2, height / 2), Qt.point(width, 0)]
    }
    LinearGradient {
        width: size
        height: size
        start: Qt.point(0,0)
        end: Qt.point(width, height)
        property string __name: "LinearGradient"
        property variant __properties: ["start", "end", "gradient", "maskSource"]
        property string __varyingProperty: "maskSource"
        property variant __values: [undefined, butterfly]
    }

    OpacityMask {
        width: size
        height: size
        source: bug
        property string __name: "OpacityMask"
        property variant __properties: ["maskSource"]
        property string __varyingProperty: "maskSource"
        property variant __values: [butterfly]
    }

    RadialGradient {
        width: size
        height: size
        property string __name: "RadialGradient"
        property variant __properties: ["horizontalOffset", "verticalOffset", "horizontalRadius", "verticalRadius", "angle", "gradient"]
        property string __varyingProperty: "horizontalOffset"
        property variant __values: [-width / 2, 0, width / 2]
    }
    RadialGradient {
        width: size
        height: size
        property string __name: "RadialGradient"
        property variant __properties: ["horizontalOffset", "verticalOffset", "horizontalRadius", "verticalRadius", "angle", "gradient"]
        property string __varyingProperty: "verticalOffset"
        property variant __values: [-height / 2, 0, height / 2]
    }
    RadialGradient {
        width: size
        height: size
        property string __name: "RadialGradient"
        property variant __properties: ["horizontalOffset", "verticalOffset", "horizontalRadius", "verticalRadius", "angle", "gradient"]
        property string __varyingProperty: "horizontalRadius"
        property variant __values: [width, width / 3]
    }
    RadialGradient {
        width: size
        height: size
        property string __name: "RadialGradient"
        property variant __properties: ["horizontalOffset", "verticalOffset", "horizontalRadius", "verticalRadius", "angle", "gradient"]
        property string __varyingProperty: "verticalRadius"
        property variant __values: [height, height / 3]
    }
    RadialGradient {
        width: size
        height: size
        property string __name: "RadialGradient"
        property variant __properties: ["horizontalOffset", "verticalOffset", "horizontalRadius", "verticalRadius", "angle", "gradient"]
        property string __varyingProperty: "gradient"
        property variant __values: [firstGradient, secondGradient, thirdGradient]
    }
    RadialGradient {
        width: size
        height: size
        horizontalRadius: width / 3
        property string __name: "RadialGradient"
        property variant __properties: ["horizontalOffset", "verticalOffset", "horizontalRadius", "verticalRadius", "angle", "gradient"]
        property string __varyingProperty: "angle"
        property variant __values: [0, 45, 90]
    }
    RadialGradient {
        width: size
        height: size
        property string __name: "RadialGradient"
        property variant __properties: ["horizontalOffset", "verticalOffset", "horizontalRadius", "verticalRadius", "angle", "gradient", "maskSource"]
        property string __varyingProperty: "maskSource"
        property variant __values: [undefined, butterfly]

        function uninit() { checkerboard = false }
    }

    RectangularGlow {
        function init() {
            background = "black"
            rect.visible = true
        }
        width: rect.width
        height: rect.height
        x: rect.x
        property string __name: "RectangularGlow"
        property variant __properties: ["glowRadius", "spread", "color", "cornerRadius"]
        property string __varyingProperty: "glowRadius"
        property variant __values: [10, 20, 40]
        cornerRadius: 25
    }
    RectangularGlow {
        width: rect.width
        height: rect.height
        x: rect.x
        property string __name: "RectangularGlow"
        property variant __properties: ["glowRadius", "spread", "color", "cornerRadius"]
        property string __varyingProperty: "spread"
        property variant __values: ["0.0", "0.5", "1.0"]
        cornerRadius: 25
        glowRadius: 20
    }
    RectangularGlow {
        width: rect.width
        height: rect.height
        x: rect.x
        property string __name: "RectangularGlow"
        property variant __properties: ["glowRadius", "spread", "color", "cornerRadius"]
        property string __varyingProperty: "color"
        property variant __values: ["#ffffff", "#55ff55", "#5555ff"]
        cornerRadius: 25
        glowRadius: 20
    }
    RectangularGlow {
        width: rect.width
        height: rect.height
        x: rect.x
        property string __name: "RectangularGlow"
        property variant __properties: ["glowRadius", "spread", "color", "cornerRadius"]
        property string __varyingProperty: "cornerRadius"
        property variant __values: [0, 25, 50]
        glowRadius: 20

        function uninit() {
            background = "white"
            rect.visible = false
        }
    }

    RecursiveBlur {
        function init() {
            timer.interval = 2000
            checkerboard = true
            }

        width: size
        height: size
        source: bug
        radius: 7.5
        property string __name: "RecursiveBlur"
        property variant __properties: ["loops", "radius"]
        property string __varyingProperty: "loops"
        property variant __values: [4, 20, 70]
    }
    RecursiveBlur {
        width: size
        height: size
        source: bug
        loops: 20
        property string __name: "RecursiveBlur"
        property variant __properties: ["loops", "radius"]
        property string __varyingProperty: "radius"
        property variant __values: [2.5, 4.5, 7.5]
    }
    RecursiveBlur {
        width: size
        height: size
        source: bug
        loops: 20
        radius: 7.5
        property string __name: "RecursiveBlur"
        property variant __properties: ["loops", "radius", "transparentBorder"]
        property string __varyingProperty: "transparentBorder"
        property variant __values: [false, true]

        function uninit() {
            timer.interval = timerInterval
            checkerboard = false
        }
    }

    ThresholdMask {
        width: size
        height: size
        source: bug
        maskSource: fog
        threshold: 0.4
        property string __name: "ThresholdMask"
        property variant __properties: ["spread", "threshold"]
        property string __varyingProperty: "spread"
        property variant __values: ["0.0", "0.2", "0.8"]
        function init() { checkerboard = true }
    }
    ThresholdMask {
        width: size
        height: size
        source: bug
        maskSource: fog
        spread: 0.2
        property string __name: "ThresholdMask"
        property variant __properties: ["spread", "threshold"]
        property string __varyingProperty: "threshold"
        property variant __values: ["0.0", "0.5", "0.7"]
        function uninit() { checkerboard = false }
    }

    RadialBlur {
        width: size
        height: size
        source: butterfly
        samples: 32
        property string __name: "RadialBlur"
        property variant __properties: ["samples", "angle", "horizontalOffset", "verticalOffset"]
        property string __varyingProperty: "angle"
        property variant __values: ["0.0", "15.0", "30.0"]
        function uninit() { checkerboard = false }
    }

    RadialBlur {
        width: size
        height: size
        source: butterfly
        samples: 32
        angle: 20
        property string __name: "RadialBlur"
        property variant __properties: ["samples", "angle", "horizontalOffset", "verticalOffset"]
        property string __varyingProperty: "horizontalOffset"
        property variant __values: ["75.0", "0.0", "-75.0"]
        function uninit() { checkerboard = false }
    }

    DirectionalBlur {
        width: size
        height: size
        source: butterfly
        samples: 32
        length: 32
        property string __name: "DirectionalBlur"
        property variant __properties: ["samples", "angle", "length"]
        property string __varyingProperty: "angle"
        property variant __values: ["0.0", "45.0", "90.0"]
        function uninit() { checkerboard = false }
    }

    DirectionalBlur {
        width: size
        height: size
        source: butterfly
        samples: 32
        property string __name: "DirectionalBlur"
        property variant __properties: ["samples", "angle", "length"]
        property string __varyingProperty: "length"
        property variant __values: ["0.0", "32.0", "48.0"]
        function uninit() { checkerboard = false }
    }

    ZoomBlur {
        width: size
        height: size
        source: butterfly
        samples: 32
        length: 32
        property string __name: "ZoomBlur"
        property variant __properties: ["samples", "length", "horizontalOffset", "verticalOffset"]
        property string __varyingProperty: "horizontalOffset"
        property variant __values: ["100.0", "0.0", "-100.0"]
        function uninit() { checkerboard = false }
    }

    ZoomBlur {
        width: size
        height: size
        source: butterfly
        samples: 32
        property string __name: "ZoomBlur"
        property variant __properties: ["samples", "length", "horizontalOffset", "verticalOffset"]
        property string __varyingProperty: "length"
        property variant __values: ["0.0", "32.0", "48.0"]
        function uninit() { checkerboard = false }
    }

    LevelAdjust {
        width: size
        height: size
        source: butterfly
        property string __name: "LevelAdjust"
        property variant __properties: ["minimumInput", "maximumInput", "minimumOutput", "maximumOutput", "gamma"]
        property string __varyingProperty: "minimumInput"
        property variant __values: ["#00000000", "#00000040", "#00000070"]
    }

    LevelAdjust {
        width: size
        height: size
        source: butterfly
        property string __name: "LevelAdjust"
        property variant __properties: ["minimumInput", "maximumInput", "minimumOutput", "maximumOutput", "gamma"]
        property string __varyingProperty: "maximumInput"
        property variant __values: ["#FFFFFFFF", "#FFFFFF80", "#FFFFFF30"]
    }

    LevelAdjust {
        width: size
        height: size
        source: butterfly
        property string __name: "LevelAdjust"
        property variant __properties: ["minimumInput", "maximumInput", "minimumOutput", "maximumOutput", "gamma"]
        property string __varyingProperty: "minimumOutput"
        property variant __values: ["#00000000", "#00000070", "#000000A0"]
    }

    LevelAdjust {
        width: size
        height: size
        source: butterfly
        property string __name: "LevelAdjust"
        property variant __properties: ["minimumInput", "maximumInput", "minimumOutput", "maximumOutput", "gamma"]
        property string __varyingProperty: "maximumOutput"
        property variant __values: ["#FFFFFFFF", "#FFFFFF80", "#FFFFFF30"]
    }

    MaskedBlur {
        width: size
        height: size
        source: butterfly
        maskSource: blurMask
        maximumRadius: 16
        property string __name: "MaskedBlur"
        property variant __properties: ["radius", "maximumRadius", "transparentBorder", "fast"]
        property string __varyingProperty: "radius"
        property variant __values: [0.0, 8.0, 16.0]
    }
    MaskedBlur {
        width: size
        height: size
        source: butterfly
        maskSource: blurMask
        radius: 16
        maximumRadius: 16
        property string __name: "MaskedBlur"
        property variant __properties: ["radius", "maximumRadius", "transparentBorder", "fast"]
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
        maximumRadius: 16
        fast: true
        property string __name: "MaskedBlur"
        property variant __properties: ["radius", "maximumRadius", "transparentBorder", "fast"]
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
