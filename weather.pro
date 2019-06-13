TEMPLATE = app
QT = quick

SOURCES += \
        main.cpp

RESOURCES += qml.qrc \
    fonts.qrc

target.path = /opt/$${TARGET}/bin
INSTALLS += target
