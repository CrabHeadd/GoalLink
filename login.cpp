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
    if(quer.prepare("select accID from accounts where username = :userIn and password = :passIn")){
        qDebug() << "here";
    }
    quer.bindValue(":userIn",usr);
    quer.bindValue(":passIn",pss);
    if (quer.exec()){
        qDebug() << "exec" << quer.isActive() << quer.isSelect();
        if(quer.next()){
            qDebug() <<"hi" << quer.value("accID");
            int accID = quer.value("accID").toBool();
            emit result(accID);
            return;
        }
        emit result(false);
    }
}
