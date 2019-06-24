import QtQuick 2.12
import QtQuick.Window 2.12

ListView {
    id: q
    Rectangle {
        anchors.fill: parent
        color: '#000000'
        opacity: 0.25
        z: -1
    }
    clip: true
    section.property: 'pref'
    section.criteria: ViewSection.FullString
    section.labelPositioning: ViewSection.CurrentLabelAtStart
    section.delegate: Item {
        width: ListView.view.width
        height: window.height / 10
        Label {
            anchors.fill: parent
            text: section
        }
        Rectangle {
            anchors.fill: parent
            z: -1
            color: '#000000'
            opacity: 0.75
        }
    }
}
