import QtQml 2.2
import QtQml.Models 2.3

ListModel {
    id: q
    property bool loading: true

    Component.onCompleted: {
        let xhr = new XMLHttpRequest
        xhr.onreadystatechange = function() {
            switch (xhr.readyState) {
            case XMLHttpRequest.DONE:
                let rss = xhr.responseXML.documentElement
                for (let i = 0; i < rss.childNodes.length; i++) {
                    if (rss.childNodes[i].nodeName === 'channel') {
                        let channel = rss.childNodes[i]
                        for (let j = 0; j < channel.childNodes.length; j++) {
                            if (channel.childNodes[j].nodeName === 'source') {
                                let source = channel.childNodes[j]
                                for (let k = 0; k < source.childNodes.length; k++) {
                                    if (source.childNodes[k].nodeName === 'pref') {
                                        let pref = source.childNodes[k]
                                        var item = {}
                                        for (let l = 0; l < pref.attributes.length; l++) {
                                            if (pref.attributes[l].nodeName === 'title')
                                                item.pref = pref.attributes[l].nodeValue
                                        }
                                        for (let l = 0; l < pref.childNodes.length; l++) {
                                            if (pref.childNodes[l].nodeName === 'city') {
                                                let city = pref.childNodes[l]
                                                for (let m = 0; m < city.attributes.length; m++) {
                                                    item[city.attributes[m].nodeName] = city.attributes[m].nodeValue
                                                }
                                                q.append(item)
//                                                console.debug(l, q.count, item.pref, item.id, item.title)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                q.loading = false
                break
            }
        }
        q.loading = true
        xhr.open('GET', 'http://weather.livedoor.com/forecast/rss/primary_area.xml')
        xhr.send()
    }
}
