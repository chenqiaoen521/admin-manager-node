var Sequelize = require('sequelize')
var db = require('./database')
var Auth = require('./auth')
/*
 * 角色
 * 
 */
const Role = db.define('yd_roles', {
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  name: {
    type: Sequelize.STRING
  },
  groupid: {
    type: Sequelize.STRING
  }
})




//Role.sync({force: true})
module.exports = Role