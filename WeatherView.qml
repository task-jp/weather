import QtQuick 2.12
import QtQuick.Window 2.12

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
        spacing: Screen.pixelDensity * 2
        anchors.centerIn: parent

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: Screen.pixelDensity * 5

            Repeater {
                id: repeater
                model: q.model
            }
        }


        Label {
            text: q.model.description
            width: q.width
            wrapMode: Label.WrapAnywhere
            font.pixelSize: Screen.pixelDensity * 3
        }
    }
}
