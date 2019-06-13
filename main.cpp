#include <QtGui/QGuiApplication>
#include <QtGui/QFontDatabase>
#include <QtQml/QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    app.setApplicationDisplayName(QStringLiteral("Weather"));
    app.setOrganizationName(QStringLiteral("TasukuSuzuki"));
    app.setOrganizationDomain(QStringLiteral("qt5.jp"));

    QFontDatabase::addApplicationFont(QStringLiteral(":/font.otf"));

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
