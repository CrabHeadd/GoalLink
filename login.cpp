#include "login.h"

login::login(QObject *parent)
    : QObject{parent}
{   data = QSqlDatabase::addDatabase("SQLITE");
    data.setDatabaseName("/Users/giovannigil/Button/goalLink.db");
    data.open();}

void login::checkLogin(QString usr, QString pss)
{
    QSqlQuery quer(data);
    quer.prepare("select accID from accounts where username = :userIn and password = :passIn");
    quer.bindValue(":userIn",usr);
    quer.bindValue(":passIn",pss);
    if (quer.exec() && quer.next()){
        int accID = quer.value("accID").toInt();
        emit result(accID);
    }
}
