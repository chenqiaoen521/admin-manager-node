var Sequelize = require('sequelize')
var db = require('./database')

/*
 * 用户
 * 
 */
const User = db.define('yd_users', {
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  username: {
    type: Sequelize.STRING,
    unique: true
  },
  password: {
    type: Sequelize.STRING
  },
  status: {
    type: Sequelize.BOOLEAN, allowNull: false, defaultValue: true
  },
  yd_role_id: {
    type: Sequelize.INTEGER,
    references: {
      model: 'yd_roles',
      key: 'id'
    }
  }
})
// User.sync({force: true})
module.exports = User