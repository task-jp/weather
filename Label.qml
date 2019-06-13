import QtQuick 2.12

Text {
    id: q
    property int unitSize: window.height / 20
    horizontalAlignment: Text.AlignLeft
    verticalAlignment: Text.AlignVCenter
    font.pixelSize: unitSize
    font.family: 'Noto Sans JP'
    color: 'white'
}
