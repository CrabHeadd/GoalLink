#include "supabase.h"

#include <QNetworkRequest>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QDebug>

Supabase::Supabase(QObject *parent)
    : QObject{parent}
{
    supabaseUrl = "https://cqsursvdhuqkggvarapx.supabase.co";

    apiKey = "sb_publishable_VayPGgZAg5mq9jWChyY8Qg_oxaW0DLz";
}

void Supabase::testConnection()
{
    QNetworkRequest request;

    request.setUrl(QUrl(supabaseUrl + "/rest/v1/accounts?select=*"));

    request.setRawHeader("apikey", apiKey.toUtf8());

    request.setRawHeader("Authorization",
                         ("Bearer " + apiKey).toUtf8());

    QNetworkReply *reply = manager.get(request);

    connect(reply, &QNetworkReply::finished,
            this, [reply]() {

                qDebug() << "Connection Response:";
                qDebug() << reply->readAll();

                reply->deleteLater();
            });
}

void Supabase::getAccounts()
{
    QNetworkRequest request;

    request.setUrl(QUrl(supabaseUrl + "/rest/v1/accounts?select=*"));

    request.setRawHeader("apikey", apiKey.toUtf8());

    request.setRawHeader("Authorization",
                         ("Bearer " + apiKey).toUtf8());

    QNetworkReply *reply = manager.get(request);

    connect(reply, &QNetworkReply::finished,
            this, [reply]() {

                QByteArray response = reply->readAll();

                qDebug() << "Accounts:";
                qDebug() << response;

                reply->deleteLater();
            });
}

void Supabase::addAccount(QString username,
                          QString password,
                          bool isRecruiter,
                          QString position,
                          QString answer)
{
    QNetworkRequest request;

    request.setUrl(QUrl(supabaseUrl + "/rest/v1/accounts"));

    request.setHeader(QNetworkRequest::ContentTypeHeader,
                      "application/json");

    request.setRawHeader("apikey", apiKey.toUtf8());

    request.setRawHeader("Authorization",
                         ("Bearer " + apiKey).toUtf8());

    request.setRawHeader("Prefer", "return=representation");

    QJsonObject json;

    json["username"] = username;
    json["password"] = password;
    json["isRecruiter"] = isRecruiter;
    json["position"] = position;
    json["color"] = "#ffffff";
    json["answer"] = answer;

    QJsonDocument doc(json);

    QNetworkReply *reply =
        manager.post(request, doc.toJson());

    connect(reply, &QNetworkReply::finished,
            this, [reply]() {

                QByteArray response = reply->readAll();

                qDebug() << "Insert Response:";
                qDebug() << response;

                reply->deleteLater();
            });
}
