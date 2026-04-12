#ifndef LOGIN_H
#define LOGIN_H
#include <QObject>
#include <QtQml>
#include <QSqlQuery>
#include <QSqlDatabase>

class login : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QSqlDatabase data;
public:
    explicit login(QObject *parent = nullptr);
    Q_INVOKABLE void checkLogin(QString usr, QString pss);
signals:
    void result(int res);
};

#endif // LOGIN_H
