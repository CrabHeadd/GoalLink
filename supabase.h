#ifndef SUPABASE_H
#define SUPABASE_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QString>

class Supabase : public QObject
{
    Q_OBJECT

public:
    explicit Supabase(QObject *parent = nullptr);

    void testConnection();

    void getAccounts();

    void addAccount(QString username,
                    QString password,
                    bool isRecruiter,
                    QString position,
                    QString answer);

private:
    QNetworkAccessManager manager;

    QString supabaseUrl;
    QString apiKey;
};

#endif // SUPABASE_H
