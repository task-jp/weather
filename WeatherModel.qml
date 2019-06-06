import QtQml 2.2
import QtQml.Models 2.3

ListModel {
    id: q

    property string cityID
    property string title
    property string description
    property date publicTime
    property var copyright

    onCityIDChanged: {
        q.clear()
        if (q.cityID.length === 0) return
        let xhr = new XMLHttpRequest
        xhr.onreadystatechange = function() {
            q.clear()
            switch (xhr.readyState) {
            case XMLHttpRequest.DONE:
                var json = JSON.parse(xhr.responseText)
                q.title = json.title
                q.description = json.description.text.replace(/\n+/g, '\n')
                q.publicTime = new Date(json.publicTime)
                q.copyright = json.copyright
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
