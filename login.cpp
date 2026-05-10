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
    quer.prepare("select accID,position from accounts where username = :userIn and password = :passIn");
    quer.bindValue(":userIn",usr);
    quer.bindValue(":passIn",pss);
    if (quer.exec()){
        if(quer.next()){
            int accID = quer.value("accID").toInt();
            QString position = quer.value("position").toString();
            qDebug() << accID << " " << position;
            emit result(accID,position);
            return;
        }
        emit result(false,QString(""));
    }
}

bool Login::getlikes(int accID,int postID){
    QSqlQuery quer(data);
    quer.prepare("select liked from likes where accID=:accID and postID=:postID");
    quer.bindValue(":accID",accID);
    quer.bindValue(":postID",postID);
    if (quer.exec()){
        if (quer.next()){
            qDebug() << "FOUND";
            bool ans = quer.value("liked").toBool();
            emit liked(ans);
            return true;
        }
        else{
            qDebug() << "NOT FOUND";
            emit liked(false);
            return false;
        }
    }
    qDebug() << "ERROR";
    return false;
}

