#include "login.h"

#include <qdebug.h>
#include <QSqlError>

Login::Login(QObject *parent)
    : QObject{parent}
{   data = QSqlDatabase::database();
    if(data.open()){
        qDebug() << "great" << QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/goalLink.db";
    }
}

void Login::checkLogin(QString usr, QString pss, bool isRec)
{
    QSqlQuery quer(data);
    quer.prepare("select accID,position from accounts where username = :userIn and password = :passIn and isRecruiter == :isRec;");
    quer.bindValue(":userIn",usr);
    quer.bindValue(":passIn",pss);
    quer.bindValue(":isRec",isRec);
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
    qDebug() << "HERE";
    if(quer.exec()){
        qDebug() << "HERE";
        if(quer.next()){
            qDebug() << "HERE " << accID;
            nextID = quer.value("max(postID)").toInt();
            nextID +=1;
            qDebug() << nextID;

            QSqlQuery quer2(data);
            quer2.prepare("insert into posts(postID,description,likes,accID) values (:pID,:tex,0,:aID);");
            quer2.bindValue(":aID",accID);
            quer2.bindValue(":tex",text);
            quer2.bindValue(":pID",nextID);

            if(quer2.exec()){
                qDebug() << "success";
            }
            else{
                qDebug() << quer2.lastError();
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

void Login::setColor(int accID, QString col){
    QSqlQuery quer(data);
    quer.prepare("update accounts set color = :col where accID == :accID;");
    quer.bindValue(":accID",accID);
    quer.bindValue(":col",col);
    quer.exec();
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

bool Login::addAcc(QString usr, QString pass,QString sec,bool isRec, QString pos){
    int nextID;
    QSqlQuery quer(data);
    quer.prepare("select * from accounts where username = :usr;");
    quer.bindValue(":usr",usr);
    if(quer.exec()){
        if (quer.next()){
            return false;
        }
    }

    quer.prepare("select max(accID) from accounts;");
    if(quer.exec()){
        if(quer.next()){
            nextID = quer.value("max(accID)").toInt();
            nextID +=1;


            quer.prepare("insert into accounts(accID,username,password,isRecruiter,position,color,answer) values (:nxtID,:usr,:pass,:isRec,:pos,\"#ffffff\",:sec);");
            quer.bindValue(":nxtID",nextID);
            quer.bindValue(":usr",usr);
            quer.bindValue(":pass",pass);
            quer.bindValue(":isRec",isRec);
            quer.bindValue(":pos",pos);
            quer.bindValue(":sec",sec);
            if(quer.exec()){
                return true;
            }

        }
    }
}

int Login::getAccID(QString usr){
    QSqlQuery quer(data);
    quer.prepare("select accID from accounts where username = :usr");
    quer.bindValue(":usr",usr);
    if (quer.exec()){
        if(quer.next()){
            int accID = quer.value("accID").toInt();
            return accID;
        }
    }
}
void Login::deleteAcc(QString usr){
    int ID, accID;
    accID = getAccID(usr);
    QSqlQuery quer(data);

    quer.prepare("delete from posts where accID = :accID;");
    quer.bindValue(":accID",accID);
    quer.exec();

    quer.prepare("delete from likes where accID == :accID;");
    quer.bindValue(":accID",accID);
    quer.exec();

    quer.prepare("update posts set likes = (select count(*) from likes where likes.postID = posts.postID and liked = 1);");
    quer.exec();

    quer.prepare("delete from accounts where username = :usr;");
    quer.bindValue(":usr",usr);
    quer.exec();


}

QString Login::passwordVer(QString pass){
    bool four = false, spec = false, upper = false, lower = false,len = false;
    int i;

    for (i=0; i < pass.length();i++){
        if (pass[i].isUpper()) {
            upper = true;
        }

        if (pass[i].isLower()) {
            lower = true;
        }

        if (!pass[i].isLetterOrNumber()) {
            spec = true;
        }
    }
    if (i <6){
        return "Password must be at least\n six characters long";
    }
    if (!upper){
        return "Password must contain \n"
               "at least one upper letter";
    }
    if (!lower){
        return "Password must contain \n"
               "at least one lowercase letter";
    }
    if (!spec){
        return "Password must contain \n"
               "at least one special letter";
    }

    return "";
}
