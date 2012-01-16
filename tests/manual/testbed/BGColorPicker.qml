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

Label {
    id: bgColorPicker
    property color color: "#242424"
    caption: "Background color"
    Image {
        id: highlight
        source: "images/color_selection_hl.png"
        width: 18; height: 18;
        x: 37
        y: 0
    }

    Row {
        y: 3
        spacing: 8
        Rectangle { width: 12; height: 12; color: "#ffffff"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    bgColorPicker.color = parent.color
                    highlight.x = parent.x - 3
                }
            }
        }
        Rectangle { width: 12; height: 12; color: "#ababab"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    bgColorPicker.color = parent.color
                    highlight.x = parent.x - 3
                }
            }
        }
        Rectangle { width: 12; height: 12; color: "#242424"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    bgColorPicker.color = parent.color
                    highlight.x = parent.x - 3
                }
            }
        }
        Rectangle { width: 12; height: 12; color: "#000000"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    bgColorPicker.color = parent.color
                    highlight.x = parent.x - 3
                }
            }
        }
        Image {source: "images/background.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    bgColorPicker.color = "#010101"
                    highlight.x = parent.x - 3
                }
            }
        }
    }
}
