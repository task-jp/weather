import QtQuick 2.12
import QtQuick.Window 2.12

MouseArea {
    id: cityDelegate
    height: Screen.pixelDensity * 5 * 2
    Label {
        anchors.fill: parent
        text: '  ' + model.title
    }
}
