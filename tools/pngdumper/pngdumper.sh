#!/bin/bash
#############################################################################
##
## Copyright (C) 2021 The Qt Company Ltd.
## Contact: https://www.qt.io/licensing/
##
## This file is the build configuration utility of the Qt Toolkit.
##
## $QT_BEGIN_LICENSE:COMM$
##
## Commercial License Usage
## Licensees holding valid commercial Qt licenses may use this file in
## accordance with the commercial license agreement provided with the
## Software or, alternatively, in accordance with the terms contained in
## a written agreement between you and The Qt Company. For licensing terms
## and conditions see https://www.qt.io/terms-conditions. For further
## information use the contact form at https://www.qt.io/contact-us.
##
## $QT_END_LICENSE$
##
##
##
##
##
##
##
##
############################################################################

# This script must be run from its current folder.
# Example of usage: ./pngdumper.sh -platform xcb

rm ItemModel.qml
cp ItemModel1.qml ItemModel.qml
qmlscene pngdumper.qml $1 $2

rm ItemModel.qml
cp ItemModel2.qml ItemModel.qml
qmlscene pngdumper.qml $1 $2

rm ItemModel.qml
cp ItemModel3.qml ItemModel.qml
qmlscene pngdumper.qml $1 $2

rm ItemModel.qml
cp ItemModel4.qml ItemModel.qml
qmlscene pngdumper.qml $1 $2

rm ItemModel.qml
