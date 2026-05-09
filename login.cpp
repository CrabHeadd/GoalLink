#include "login.h"
#include <qdebug.h>

Login::Login(QObject *parent)
    : QObject{parent}
{   data = QSqlDatabase::addDatabase("QSQLITE");
    data.setDatabaseName("/Users/giovannigil/Button/goalLink.db");
    if(data.open()){
        qDebug() << "great";
    }
}

void Login::checkLogin(QString usr, QString pss)
{
    QSqlQuery quer(data);
    quer.prepare("select accID from accounts where username = :userIn and password = :passIn");
    quer.bindValue(":userIn",usr);
    quer.bindValue(":passIn",pss);
    if (quer.exec()){
        qDebug() << "exec" << quer.isActive() << quer.isSelect();
        if(quer.next()){
            int accID = quer.value("accID").toBool();
            int position = quer.value("position").toString();
            emit result(accID,position);
            return;
        }
        emit result(false,QString(""));
    }
}
/*
void Login::getUserData(int accID){
    QSqlQueryquer(data);
    quer.prepare("select")
}
*/
