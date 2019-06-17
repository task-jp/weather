import QtQuick 2.12

Row {
    id: q
    property var copyright

    Image {
        id: icon
        anchors.verticalCenter: parent.verticalCenter
        smooth: true
        antialiasing: true
    }

    Label {
        id: text
        anchors.verticalCenter: parent.verticalCenter
    }

    states: [
        State {
            when: typeof q.copyright === 'object'
            PropertyChanges {
                target: icon
                width: q.copyright.image.width * 3
                height: q.copyright.image.height * 3
                source: q.copyright.image.url
            }
            PropertyChanges {
                target: text
                text: q.copyright.title
            }
        }
    ]
}
