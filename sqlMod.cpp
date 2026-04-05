#include "sqlMod.h"

QHash<int,QByteArray> sqlMod::roleName() const{
    auto roles = QSqlTableModel::roleNames();
    roles.insert(1, "state"); // 2
    return roles;
}
