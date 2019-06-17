import QtQuick 2.12
import QtQuick.Window 2.12

MouseArea {
    id: cityDelegate
    height: window.height / 10
    Label {
        anchors.fill: parent
        text: '  ' + model.title
    }
}
