TEMPLATE = app
QT = quick

SOURCES += \
        main.cpp

RESOURCES += qml.qrc

target.path = /opt/$${TARGET}/bin
INSTALLS += target
