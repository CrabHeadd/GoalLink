#ifndef SQLMOD_H
#define SQLMOD_H
#include <QSqlTableModel>
#include <QHash>
#endif // SQLMOD_H


class sqlMod : public QSqlTableModel {
    Q_OBJECT
public:
    QHash<int,QByteArray> roleNames() const override;
};

