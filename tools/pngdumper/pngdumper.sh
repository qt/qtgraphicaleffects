#!/bin/bash
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
