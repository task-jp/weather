import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: window
    visible: true
    width: 1920
    height: 1080

    Background {
        anchors.fill: parent
    }

    Loader {
        id: font
        source: 'NotoSansJP.qml'
        asynchronous: true
    }

    Loader {
        id: frontend
        source: 'Frontend.qml'
        asynchronous: true
        active: font.status == Loader.Ready
        anchors.fill: parent
    }
}
