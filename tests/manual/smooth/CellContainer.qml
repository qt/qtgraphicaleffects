import QtQuick 2.9
import QtQuick.Layouts 1.3

Item {
    implicitWidth: children[0].implicitWidth * children[0].scale
    implicitHeight: children[0].implicitHeight * children[0].scale

    Layout.alignment: Qt.AlignHCenter
}
