#ifndef SQLMOD_H
#define SQLMOD_H
#include <QSqlTableModel>
#include <QSqlRelationalTableModel>
#include <QHash>


class sqlMod : public QSqlRelationalTableModel {
    Q_OBJECT
public:
    explicit sqlMod(QObject *parent = nullptr,QSqlDatabase db = QSqlDatabase());
    QHash<int,QByteArray> roleNames() const override;
    QVariant data(const QModelIndex &index, int role) const override;
    Q_INVOKABLE void updateMod();
};

#endif // SQLMOD_H
