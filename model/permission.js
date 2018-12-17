var Sequelize = require('sequelize')
var db = require('./database')

/*
 * 角色
 * 
 */
const Role2 = db.define('role2', {
  roleId: {
    type: Sequelize.INTEGER,
    field: 'role_id',
    primaryKey: true,
    autoIncrement: true
  },
  roleCode: {
    type: Sequelize.STRING,
    field: 'role_code'
  },
  roleName: {
    type: Sequelize.STRING,
    field: 'role_name'
  },
  memo: {
    type: Sequelize.STRING,
    field: 'memo'
  }
}, {
  freezeTableName: true // Model 对应的表名将与model名相同
})

//Role2.sync({force: true})

/*
 * 权限
 * 
 */
const Permission = db.define('yd_perm', {
  permissionId: {
    field: 'permission_id',
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
})
Permission.belongsToMany(Role2, {through: 'RolePermission'});
Role2.belongsToMany(Permission, {through: 'RolePermission'});
module.exports = {
  Permission,Role2
}