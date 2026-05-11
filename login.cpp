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
            bool ans = quer.value("liked").toBool();
            return ans;
        }
        else{
            quer.prepare("insert into likes(liked, accID, postID) values (0,:accID,:postID);");
            quer.bindValue(":accID",accID);
            quer.bindValue(":postID",postID);
            quer.exec();
            return false;
        }
    }
    qDebug() << "ERROR";
    return false;
}

void Login::addPost(int accID, QString text){
    int nextID;
    QSqlQuery quer(data);
    quer.prepare("select max(postID) from posts;");
    if(quer.exec()){
        if(quer.next()){
            nextID = quer.value("max(postID)").toInt();
            nextID +=1;
            qDebug() << nextID;

            QSqlQuery quer2(data);
            quer2.prepare("insert into posts(postID,description,likes,accID) values (:pID,:tex,0,:aID);");
            quer2.bindValue(":aID",accID);
            quer2.bindValue(":pID",nextID);
            quer2.bindValue(":tex",text);
            if(quer2.exec()){
                qDebug() << "success";
            }
        }
    }

}

QString Login::getColor(int accID){
    QString col = "black";
    QSqlQuery quer(data);
    quer.prepare("select color from accounts where accID ==:accID");
    quer.bindValue(":accID",accID);
    if(quer.exec()){
        if (quer.next()){
            col = quer.value("color").toString();
            return col;
        }
    }
}

void Login::likeToggle(int accID,int postID){
    if (getlikes(accID,postID)){
        QSqlQuery quer(data);
        quer.prepare("update likes set liked = false where accID == :accID and postID == :postID;");
        quer.bindValue(":accID",accID);
        quer.bindValue(":postID",postID);
        quer.exec();

        quer.prepare("update posts set likes = likes-1 where postID == :postID;");
        quer.bindValue(":postID",postID);
        quer.exec();
    }
    else{
        QSqlQuery quer(data);
        quer.prepare("update likes set liked = true where accID == :accID and postID == :postID;");
        quer.bindValue(":accID",accID);
        quer.bindValue(":postID",postID);
        quer.exec();

        quer.prepare("update posts set likes = likes+1 where postID == :postID;");
        quer.bindValue(":postID",postID);
        quer.exec();
    }
}
