TEMPLATE = app
QT = quick

SOURCES += \
        main.cpp

RESOURCES += qml.qrc \
    fonts.qrc

target.path = $$[QT_SYSROOT]/opt/$${TARGET}/bin
INSTALLS += target
