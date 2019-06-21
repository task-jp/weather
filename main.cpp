#include <QtCore/QDebug>
#include <QtCore/QDir>
#include <QtGui/QGuiApplication>
#include <QtGui/QFontDatabase>
#include <QtQml/QQmlApplicationEngine>
#include <QtQuick/QQuickWindow>

#ifdef Q_OS_LINUX
#include <sys/time.h>
#include <sys/resource.h>
#endif

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    app.setApplicationDisplayName(QStringLiteral("Weather"));
    app.setOrganizationName(QStringLiteral("TasukuSuzuki"));
    app.setOrganizationDomain(QStringLiteral("qt5.jp"));

    QDir bin = app.applicationDirPath();
    if (bin.exists("../share/fonts/NotoSansJP-Regular.otf")) {
        // installed path
        QFontDatabase::addApplicationFont(bin.absoluteFilePath("../share/fonts/NotoSansJP-Regular.otf"));
    } else if (bin.exists("../weather/NotoSansJP-Regular.otf")) {
        // sourse path
        QFontDatabase::addApplicationFont(bin.absoluteFilePath("../weather/NotoSansJP-Regular.otf"));
    } else {
        qWarning() << "bundled font not found and not installed";
    }

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
    if (argc > 1 && QString("-close") == argv[1]) {
        QQuickWindow *window = qobject_cast<QQuickWindow *>(engine.rootObjects().first());
        if (window) {
            QObject::connect(window, &QQuickWindow::frameSwapped, [&app]() {
#ifdef Q_OS_LINUX
                rusage usage;
                if (getrusage(RUSAGE_SELF, &usage) == 0) {
                    qInfo() << usage.ru_stime.tv_sec << usage.ru_stime.tv_usec << usage.ru_utime.tv_sec << usage.ru_utime.tv_usec << usage.ru_maxrss;
                }
#endif
                QMetaObject::invokeMethod(&app, "quit", Qt::QueuedConnection);
            });
        }
    }

    return app.exec();
}
