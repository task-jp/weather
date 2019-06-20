TEMPLATE = app
QT = quick

SOURCES += \
        main.cpp

RESOURCES += qml.qrc \
    fonts.qrc

QMAKE_POST_LINK = $(STRIP) $(TARGET)

target.path = $$[QT_SYSROOT]/opt/$${TARGET}/bin
INSTALLS += target
