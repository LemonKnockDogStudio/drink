#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml/qqmlregistration.h>

#include "systemcontroller.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType< SystemController >("Monty", 1, 0, "SystemController" );

    QQmlApplicationEngine engine;
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load( ":/StatusBar.qml");
    engine.load( ":/Main.qml");

    return app.exec();
}
