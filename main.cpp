#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QSqlDatabase>
#include <QSqlTableModel>
#include <QSqlError>
#include <QDebug>
#include <QFileInfo>
#include <QQmlContext>
#include <QStandardPaths>
#include <QDir>
#include <QFile>

#include "sqlMod.h"
#include "login.h"
#include "supabase.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    Supabase supabase;
    supabase.testConnection();

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection
        );

    QString dataPathDir =
        QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);

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

    QSqlDatabase Db = QSqlDatabase::addDatabase("QSQLITE");
    Db.setDatabaseName(dataPath);

    if (!Db.open()) {
        qDebug() << "INVALID DATABASE";
        qDebug() << Db.lastError().text();
        return -1;
    }

    qDebug() << "Database Loaded";
    qDebug() << "Path:" << Db.databaseName();
    qDebug() << "Exists:" << QFile::exists(Db.databaseName());
    qDebug() << "Size:" << QFileInfo(Db.databaseName()).size();
    qDebug() << "Tables:" << Db.tables();

    sqlMod model{nullptr, Db};

    model.setQuery(
        "SELECT posts.postID, "
        "posts.description, "
        "posts.likes, "
        "posts.accID, "
        "accounts.username, "
        "accounts.position, "
        "accounts.color "
        "FROM posts "
        "JOIN accounts "
        "ON posts.accID = accounts.accID;"
        );

    model.setEditStrategy(QSqlTableModel::OnFieldChange);

    if (model.select()) {
        qDebug() << "Db loaded successfully";
    } else {
        qDebug() << "Model failed to load";
    }

    engine.setInitialProperties({
        { "sqlModel", QVariant::fromValue(&model) }
    });

    engine.loadFromModule("Button", "Main");

    return app.exec();
}
