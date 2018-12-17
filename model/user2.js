var Sequelize = require('sequelize')
var db = require('./database')

/*
 * 用户
 * 
 */
const User2 = db.define('yd_users', {
  userId: {
    field: 'user_id',
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  userCode: {
    field: 'user_code',
    type: Sequelize.STRING
  },
  userName: {
    field: 'user_name',
    type: Sequelize.STRING,
    unique: true
  },
  password: {
    type: Sequelize.STRING
  },
  salt: {
    type: Sequelize.STRING
  },
  phone: {
    type: Sequelize.STRING
  },
  idcard: {
    type: Sequelize.STRING
  },
  email: {
    type: Sequelize.STRING
  },
  email: {
    type: Sequelize.INTEGER
  },
  locked: {
    type: Sequelize.INTEGER
  },
  rememberMe: {
    field: 'remember_me',
    type: Sequelize.STRING
  }
  expireDateline: {
    field: 'expire_dateline',
    type: Sequelize.DATE
  },
  online: {
    type: Sequelize.INTEGER
  },
  memo: {
    type: Sequelize.STRING
  }
})
// User.sync({force: true})
module.exports = User2