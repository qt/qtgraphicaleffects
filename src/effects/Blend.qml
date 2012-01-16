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
    property variant foregroundSource
    property string mode: "normal"
    property bool cached: false

    SourceProxy {
        id: backgroundSourceProxy
        input: rootItem.source
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

            switch (mode.toLowerCase()) {
                case "addition" : shader += blendModeAddition; break;
                case "average" : shader += blendModeAverage; break;
                case "color" : shader += blendModeColor; break;
                case "colorburn" : shader += blendModeColorBurn; break;
                case "colordodge" : shader += blendModeColorDodge; break;
                case "darken" : shader += blendModeDarken; break;
                case "darkercolor" : shader += blendModeDarkerColor; break;
                case "difference" : shader += blendModeDifference; break;
                case "divide" : shader += blendModeDivide; break;
                case "exclusion" : shader += blendModeExclusion; break;
                case "hardlight" : shader += blendModeHardLight; break;
                case "hue" : shader += blendModeHue; break;
                case "lighten" : shader += blendModeLighten; break;
                case "lightercolor" : shader += blendModeLighterColor; break;
                case "lightness" : shader += blendModeLightness; break;
                case "negation" : shader += blendModeNegation; break;
                case "normal" : shader += blendModeNormal; break;
                case "multiply" : shader += blendModeMultiply; break;
                case "saturation" : shader += blendModeSaturation; break;
                case "screen" : shader += blendModeScreen; break;
                case "subtract" : shader += blendModeSubtract; break;
                case "softlight" : shader += blendModeSoftLight; break;
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
        property string blendModeAverage: "result.rgb = 0.5 * (rgb1 + rgb2);"
        property string blendModeColor: "result.rgb = HSLtoRGB(vec3(RGBtoHSL(rgb2).xy, RGBtoL(rgb1)));"
        property string blendModeColorBurn: "result.rgb = clamp(1.0 - ((1.0 - rgb1) / max(vec3(1.0 / 256.0), rgb2)), vec3(0.0), vec3(1.0));"
        property string blendModeColorDodge: "result.rgb = clamp(rgb1 / max(vec3(1.0 / 256.0), (1.0 - rgb2)), vec3(0.0), vec3(1.0));"
        property string blendModeDarken: "result.rgb = min(rgb1, rgb2);"
        property string blendModeDarkerColor: "result.rgb = 0.3 * rgb1.r + 0.59 * rgb1.g + 0.11 * rgb1.b > 0.3 * rgb2.r + 0.59 * rgb2.g + 0.11 * rgb2.b ? rgb2 : rgb1;"
        property string blendModeDifference: "result.rgb = abs(rgb1 - rgb2);"
        property string blendModeDivide: "result.rgb = clamp(rgb1 / rgb2, 0.0, 1.0);"
        property string blendModeExclusion: "result.rgb = rgb1 + rgb2 - 2.0 * rgb1 * rgb2;"
        property string blendModeHardLight: "result.rgb = vec3(channelBlendHardLight(rgb1.r, rgb2.r), channelBlendHardLight(rgb1.g, rgb2.g), channelBlendHardLight(rgb1.b, rgb2.b));"
        property string blendModeHue: "result.rgb = HSLtoRGB(vec3(RGBtoHSL(rgb2).x, RGBtoHSL(rgb1).yz));"
        property string blendModeLighten: "result.rgb = max(rgb1, rgb2);"
        property string blendModeLighterColor: "result.rgb = 0.3 * rgb1.r + 0.59 * rgb1.g + 0.11 * rgb1.b > 0.3 * rgb2.r + 0.59 * rgb2.g + 0.11 * rgb2.b ? rgb1 : rgb2;"
        property string blendModeLightness: "result.rgb = HSLtoRGB(vec3(RGBtoHSL(rgb1).xy, RGBtoL(rgb2)));"
        property string blendModeMultiply: "result.rgb = rgb1 * rgb2;"
        property string blendModeNegation: "result.rgb = 1.0 - abs(1.0 - rgb1 - rgb2);"
        property string blendModeNormal: "result.rgb = rgb2;"
        property string blendModeSaturation: "lowp vec3 hsl1 = RGBtoHSL(rgb1); result.rgb = HSLtoRGB(vec3(hsl1.x, RGBtoHSL(rgb2).y, hsl1.z));"
        property string blendModeScreen: "result.rgb = 1.0 - (vec3(1.0) - rgb1) * (vec3(1.0) - rgb2);"
        property string blendModeSubtract: "result.rgb = max(rgb1 - rgb2, vec3(0.0));"
        property string blendModeSoftLight: "result.rgb = rgb1 * ((1.0 - rgb1) * rgb2 + (1.0 - (1.0 - rgb1) * (1.0 - rgb2)));"

        property string fragmentShaderBegin: "
            varying mediump vec2 qt_TexCoord0;
            uniform highp float qt_Opacity;
            uniform sampler2D backgroundSource;
            uniform sampler2D foregroundSource;

            highp float RGBtoL(highp vec3 color) {
                highp float cmin = min(color.r, min(color.g, color.b));
                highp float cmax = max(color.r, max(color.g, color.b));
                highp float l = (cmin + cmax) / 2.0;
                return l;
            }

            highp vec3 RGBtoHSL(highp vec3 color) {
                highp float cmin = min(color.r, min(color.g, color.b));
                highp float cmax = max(color.r, max(color.g, color.b));
                highp float h = 0.0;
                highp float s = 0.0;
                highp float l = (cmin + cmax) / 2.0;
                highp float diff = cmax - cmin;

                if (diff > 1.0 / 256.0) {
                    if (l < 0.5)
                        s = diff / (cmin + cmax);
                    else
                        s = diff / (2.0 - (cmin + cmax));

                    if (color.r == cmax)
                        h = (color.g - color.b) / diff;
                    else if (color.g == cmax)
                        h = 2.0 + (color.b - color.r) / diff;
                    else
                        h = 4.0 + (color.r - color.g) / diff;

                    h /= 6.0;
                }
                return vec3(h, s, l);
                }

            highp float hueToIntensity(highp float v1, highp float v2, highp float h) {
                h = fract(h);
                if (h < 1.0 / 6.0)
                    return v1 + (v2 - v1) * 6.0 * h;
                else if (h < 1.0 / 2.0)
                    return v2;
                else if (h < 2.0 / 3.0)
                    return v1 + (v2 - v1) * 6.0 * (2.0 / 3.0 - h);

                return v1;
            }

            highp vec3 HSLtoRGB(highp vec3 color) {
                highp float h = color.x;
                highp float l = color.z;
                highp float s = color.y;

                if (s < 1.0 / 256.0)
                    return vec3(l, l, l);

                highp float v1;
                highp float v2;
                if (l < 0.5)
                    v2 = l * (1.0 + s);
                else
                    v2 = (l + s) - (s * l);

                v1 = 2.0 * l - v2;

                highp float d = 1.0 / 3.0;
                highp float r = hueToIntensity(v1, v2, h + d);
                highp float g = hueToIntensity(v1, v2, h);
                highp float b = hueToIntensity(v1, v2, h - d);
                return vec3(r, g, b);
            }

            lowp float channelBlendHardLight(lowp float c1, lowp float c2) {
                return c2 > 0.5 ? (1.0 - (1.0 - 2.0 * (c2 - 0.5)) * (1.0 - c1)) : (2.0 * c1 * c2);
            }

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
