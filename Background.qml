import QtQuick 2.0

Rectangle {
    id: q
    color: "#5679b5"

    Repeater {
        model: 100
        Rectangle {
            x: Math.random() * q.width - width / 2
            y: Math.random() * q.height - height / 2
            width: model.index % 5 + 50
            height: width
            radius: width / 2
            color: Qt.hsla(Math.random(), 0.25, 0.75)
            opacity: 0.25
        }
    }
}
