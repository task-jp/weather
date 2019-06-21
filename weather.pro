TEMPLATE = app
QT = quick

SOURCES += \
        main.cpp

RESOURCES += qml.qrc

QMAKE_POST_LINK = $(STRIP) $(TARGET)

target.path = $$[QT_SYSROOT]/opt/$${TARGET}/bin
INSTALLS += target

font.files = NotoSansJP-Regular.otf
font.path = $$[QT_SYSROOT]/opt/$${TARGET}/share/fonts
INSTALLS += font
