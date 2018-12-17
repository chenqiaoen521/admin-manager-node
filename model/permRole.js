var Sequelize = require('sequelize')
var db = require('./database')

/*
 * 中间表
 * 
 */
const RolePermissions = db.define('role_permissions', {
  id: {
    field: 'id',
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  permissionCode: {
    field: 'permission_code',
    type: Sequelize.STRING,
    unique: true
  },
  permissionUri: {
    field: 'permission_uri',
    type: Sequelize.STRING,
    unique: true
  },
  permissionName: {
    field: 'permission_name',
    type: Sequelize.STRING
  },
  columnId: {
    field: 'column_id',
    type: Sequelize.INTEGER
  }
}, {
  freezeTableName: true // Model 对应的表名将与model名相同
})
// Permission.sync({force: true})
Permission.belongsToMany(Role2, {through: 'RolePermission', foreignKey: 'permission_id' });
module.exports = Permission;