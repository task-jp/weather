import QtQuick 2.12
import QtQuick.Window 2.12
import Qt.labs.settings 1.0

FontLoader {
    id: font
    source: fontPath
    onStatusChanged: if (font.status == FontLoader.Ready) console.log('Loaded')
}
