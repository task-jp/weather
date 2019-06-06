import QtQuick 2.12

MouseArea {
    id: q
    height: label.height * 1.5
    property var city
    property alias text: label.text
    Label {
        id: label
        anchors.centerIn: parent
        wrapMode: Label.WrapAtWordBoundaryOrAnywhere
    }

    Rectangle {
        z: -1
        anchors.fill: parent
        color: 'black'
        opacity: 0.25
    }
}
