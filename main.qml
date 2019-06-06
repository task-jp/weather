import QtQuick 2.12
import QtQuick.Window 2.12
import Qt.labs.settings 1.0

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Settings {
        id: settings
        property int index: 0
    }

    Background {
        anchors.fill: parent
    }

    CityLabel {
        id: cityLabel
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right
//        city: cityModel.get(cityView.currentIndex)
        text: weatherModel.title
        visible: opacity > 0
        onClicked: cityManager.state = 'select'
    }

    WeatherView {
        id: weatherView
        anchors.left: parent.left
        anchors.top: cityLabel.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        model: WeatherModel {
            id: weatherModel
            cityID: cityModel.get(cityView.currentIndex) ? cityModel.get(cityView.currentIndex).id : ''
        }

        delegate: Column {
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: model.dateLabel
                color: 'white'
            }
            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                source: model.image.url
                width: model.image.width * 2
                height: model.image.height * 2
                smooth: true
            }
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: '%1/%2'.arg(model.temperature.max ? model.temperature.max.celsius : '-').arg(model.temperature.min ? model.temperature.min.celsius : '-')
                color: 'white'
            }
        }
    }

    CityView {
        id: cityView
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: 0
        visible: opacity > 0
        opacity: 0
        model: CityModel {
            id: cityModel
            onLoadingChanged: {
                if (loading) return
                cityView.currentIndex = settings.index
            }
        }
        delegate: CityDelegate {
            id: cityDelegate
            width: ListView.view.width
            onClicked: {
                cityView.currentIndex = model.index
                cityManager.state = ''
            }
        }
        onCurrentIndexChanged: settings.index = cityView.currentIndex
    }

    MouseArea {
        id: close
        anchors.left: cityView.right
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        onClicked: cityManager.state = ''
        enabled: false
    }

    Copyright {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        copyright: weatherModel.copyright
    }

    StateGroup {
        id: cityManager
        states: [
            State {
                name: 'select'
                PropertyChanges {
                    target: cityLabel
                    opacity: 0
                }
                PropertyChanges {
                    target: cityView
                    opacity: 1.0
                    width: 200
                }
                PropertyChanges {
                    target: weatherView
                    opacity: 0.5
                    interactive: false
                }
                PropertyChanges {
                    target: close
                    enabled: true
                }
            }
        ]

        transitions: [
            Transition {
                NumberAnimation {
                    properties: 'opacity, width'
                    duration: 500
                    easing.type: Easing.OutExpo
                }
            }
        ]
    }
}
