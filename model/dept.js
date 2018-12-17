var Sequelize = require('sequelize')
var db = require('./database')

/*
 * 用户
 * 
 */
const Dept = db.define('yd_dept', {
  departmentId: {
    field: 'department_id',
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  departmentCode: {
    field: 'department_code',
    type: Sequelize.STRING,
    unique: true
  },
  departmentName: {
    field: 'department_name',
    type: Sequelize.STRING
  },
  parentId: {
    field: 'parent_id',
    type: Sequelize.INTEGER,
    defaultValue: 0
  },
  isChild: {
    field: 'is_child',
    type: Sequelize.INTEGER,
    defaultValue: 0 // 是否有下级0:没有，1：有
  }
})
// Dept.sync({force: true})
module.exports = Dept