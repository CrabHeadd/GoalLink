#ifndef LOGIN_H
#define LOGIN_H
#include <QObject>
#include <QtQml>
#include <QSqlQuery>
#include <QSqlDatabase>
#include <QSqlRelationalTableModel>
#include <QDir>
#include <QFile>

class Login : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QSqlDatabase data;
public:
    explicit Login(QObject *parent = nullptr);
    Q_INVOKABLE void checkLogin(QString usr, QString pss,bool isRec);
    Q_INVOKABLE bool getlikes(int accID,int postID);
    Q_INVOKABLE void addPost(int accID, QString text);
    Q_INVOKABLE QString getColor(int accID);
    Q_INVOKABLE void likeToggle(int accID,int postID);
    Q_INVOKABLE void setColor(int accID, QString col);
    Q_INVOKABLE bool addAcc(QString usr, QString pass,QString sec,bool isRec, QString pos);
    Q_INVOKABLE void deleteAcc(QString usr);
    int getAccID(QString usr);

signals:
    void result(int res,QString position);
    void liked(bool res);
};

#endif // LOGIN_H
