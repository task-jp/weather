import QtQuick 2.12

Row {
    id: q
    property var copyright

    Image {
        id: icon
        anchors.verticalCenter: parent.verticalCenter
    }

    Label {
        id: text
    }

    states: [
        State {
            when: typeof q.copyright === 'object'
            PropertyChanges {
                target: icon
                width: q.copyright.image.width
                height: q.copyright.image.height
                source: q.copyright.image.url
            }
            PropertyChanges {
                target: text
                text: q.copyright.title
            }
        }
    ]
}
