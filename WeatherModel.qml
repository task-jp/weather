import QtQml 2.2
import QtQml.Models 2.3

ListModel {
    id: q

    property string cityID
    property string title
    property string description
    property date publicTime
    property var copyright
    onCityIDChanged: reload()

    property Timer timer: Timer {
        interval: 5 * 60 * 1000
        repeat: true
        running: q.cityID.length > 0
        triggeredOnStart: true
        onTriggered: reload()
    }

    function reload() {
        let xhr = new XMLHttpRequest
        xhr.onreadystatechange = function() {
            switch (xhr.readyState) {
            case XMLHttpRequest.DONE:
                var json = JSON.parse(xhr.responseText)
                q.title = json.title
                q.description = json.description.text.replace(/\n+/g, '\n')
                q.publicTime = new Date(json.publicTime)
                q.copyright = json.copyright
                q.clear()
                var forecasts = json.forecasts
                for (var i = 0; i < forecasts.length; i++) {
                    q.append(forecasts[i])
                }
                break
            }
        }
        xhr.open('GET', 'http://weather.livedoor.com/forecast/webservice/json/v1?city=%1'.arg(q.cityID))
        xhr.send()
    }
}
