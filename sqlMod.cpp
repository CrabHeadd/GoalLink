#include "sqlMod.h"

QHash<int, QByteArray> sqlMod::roleNames() const
{
    QHash<int, QByteArray> roles;

    roles[Qt::UserRole+1] = QByteArray("postID");
    roles[Qt::UserRole+2] = QByteArray("description");
    roles[Qt::UserRole+3] = QByteArray("likes");
    roles[Qt::UserRole+4] = QByteArray("accID");
    roles[Qt::UserRole+5] = QByteArray("letter");
    return roles;
}

sqlMod::sqlMod(QObject *parent, QSqlDatabase db):QSqlRelationalTableModel(parent, db)
{
}

QVariant sqlMod::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();
    if (role < Qt::UserRole)
        return QSqlTableModel::data(index, role);
    if (role == Qt::UserRole+5){
        QModelIndex in = this->index(index.row(),3);
        QVariant val = QSqlRelationalTableModel::data(in,Qt::DisplayRole);
        QString letr = val.toString();
        if (!letr.isEmpty())
            return letr.at(0);

        return QVariant();
    }
    int column = role - Qt::UserRole - 1;

    QModelIndex modelIndex = this->index(index.row(), column);

    return QSqlTableModel::data(modelIndex, Qt::DisplayRole);
}
