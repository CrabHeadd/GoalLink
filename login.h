#ifndef LOGIN_H
#define LOGIN_H
#include <QObject>
#include <QtQml>
#include <QSqlQuery>
#include <QSqlDatabase>

class Login : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QSqlDatabase data;
public:
    explicit Login(QObject *parent = nullptr);
    Q_INVOKABLE void checkLogin(QString usr, QString pss);
    Q_INVOKABLE bool getlikes(int accID,int postID);
signals:
    void result(int res,QString position);
    void liked(bool res);
};

#endif // LOGIN_H
