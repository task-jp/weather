import QtQuick 2.12

Item {
    id: q

    property WeatherModel model
    property alias delegate: repeater.delegate

    Label {
        anchors.top: parent.top
        anchors.right: parent.right
        text: '%1 現在'.arg(q.model.publicTime ? Qt.formatDateTime(q.model.publicTime, 'hh:mm:ss') : '')
    }

    Column {
        spacing: window.height / 25
        anchors.centerIn: parent

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: window.width / 25

            Repeater {
                id: repeater
                model: q.model
            }
        }


        Label {
            text: q.model.description
            width: q.width
            wrapMode: Label.WrapAnywhere
            font.pixelSize: unitSize * 0.5
            Rectangle {
                anchors.fill: parent
                color: '#000000'
                opacity: 0.25
                z: -1
            }
        }
    }
}
