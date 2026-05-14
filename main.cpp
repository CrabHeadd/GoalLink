#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QSqlDatabase>
#include <QSqlTableModel>
#include <QSqlError>
#include <QDebug>
#include <QFileInfo>
#include <QQmlContext>
#include "sqlMod.h"
#include <QStandardPaths>
#include <QDir>
#include <QFile>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);


    //
    QString dataPathDir =QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QDir().mkpath(dataPathDir);
    QString dataPath = dataPathDir + "/goalLink.db";
    if (!QFile::exists(dataPath)) {
        QFile::copy(":/qt/qml/Button/goalLink.db", dataPath);
        QFile::setPermissions(
            dataPath,
            QFileDevice::ReadOwner |
                QFileDevice::WriteOwner |
                QFileDevice::ReadUser |
                QFileDevice::WriteUser
            );
    }
    //
    //QString path = QDir::currentPath() + "";
    //QString path = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/goalLink.db";
    QSqlDatabase Db = QSqlDatabase::addDatabase("QSQLITE");
    //QString path = QCoreApplication::applicationDirPath() + "/goalLink.db";
    Db.setDatabaseName(dataPath);
    if (!Db.open()) {
        qDebug() << "INVALID DATABASE ";
        return -1;
    }
    qDebug() << "Path:" << Db.databaseName();
    qDebug() << "Exists:" << QFile::exists(Db.databaseName());
    qDebug() << "Size:" << QFileInfo(Db.databaseName()).size();
    qDebug() << "Tables:" << Db.tables();
    sqlMod model{nullptr, Db};
    model.setQuery("select * from posts join accounts on posts.accID == accounts.accID;");
    model.setEditStrategy(QSqlTableModel::OnFieldChange);
    model.setRelation(3,QSqlRelation("accounts","accID","username"));
    if(model.select()){
        qDebug() << "Db loaded";
    }
    engine.setInitialProperties({
        { "sqlModel", QVariant::fromValue(&model) }
    });
    engine.loadFromModule("Button", "Main");
    return app.exec();
}
