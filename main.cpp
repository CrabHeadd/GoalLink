#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QSqlDatabase>
#include <QSqlTableModel>
#include <QSqlError>
#include <QDebug>
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
    engine.loadFromModule("Button", "Main");

    QSqlDatabase Db = QSqlDatabase::addDatabase("QSQLITE");
    Db.setDatabaseName("goalLink.db");
    if (!Db.open()) {
        return -1;
    }
    QSqlTableModel model{nullptr, Db};
    model.setTable("posts");
    model.setEditStrategy(QSqlTableModel::OnFieldChange);
    if(!model.select()){
        qDebug << model.lastError().text();
    }
    engine.setInitialProperties({
        { "sqlModel", QVariant::fromValue(&model) }
    });
    return app.exec();
}
