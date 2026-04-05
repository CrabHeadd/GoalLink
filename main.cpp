#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QSqlDatabase>
#include <QSqlTableModel>
#include <QSqlError>
#include <QDebug>
#include <QFile>
#include <QFileInfo>
#include <QDir>
#include <QQmlContext>
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


    QString path = QDir::currentPath() + "";
    QSqlDatabase Db = QSqlDatabase::addDatabase("QSQLITE");
    Db.setDatabaseName("/Users/giovannigil/Button/goalLink.db");
    if (!Db.open()) {
        return -1;
    }
    qDebug() << "Path:" << Db.databaseName();
    qDebug() << "Exists:" << QFile::exists(Db.databaseName());
    qDebug() << "Size:" << QFileInfo(Db.databaseName()).size();
    qDebug() << "Tables:" << Db.tables();
    QSqlTableModel model{nullptr, Db};
    model.setTable("posts");
    model.setEditStrategy(QSqlTableModel::OnFieldChange);
    if(model.select()){
        qDebug() << "Db loaded";
    }
    engine.setInitialProperties({
        { "sqlModel", QVariant::fromValue(&model) }
    });
    engine.loadFromModule("Button", "Main");
    return app.exec();
}
