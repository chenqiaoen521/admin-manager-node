var Sequelize = require('sequelize')
var db = require('./database')

/*
 * 权限
 * 
 */
const Auth = db.define('yd_auths', {
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  path: {
    type: Sequelize.STRING
  },
  pathname: {
    type: Sequelize.STRING
  },
  parentid: {
    type: Sequelize.INTEGER,
    defaultValue: -1
  }
})
// Auth.sync({force: true})
module.exports = Auth