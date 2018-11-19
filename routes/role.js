const Router = require('koa-router')
const router = new Router()
const jwt = require('jsonwebtoken')
const util = require('util')
const verify = util.promisify(jwt.verify)
const secret = 'jwt wwxx'
const Role = require('../model/role')
const Auth = require('../model/auth')
const User = require('../model/user')
const sequelize = require('sequelize')
router.prefix('/api')

router.get('/user/role/list', async (ctx,next)=>{
  let {page, limit} = ctx.request.query
  let count = -1
  await Role.find({
    attributes: [[sequelize.fn('COUNT', sequelize.col('*')), 'count']]
  }).then(res => {
    count = JSON.parse(JSON.stringify(res)).count
  })
  let params
  if (page !== undefined && limit !== undefined) {
    let offset = (~~page-1) * limit
    params = {offset, limit: ~~limit}
  } else {
    params = {where: {}}
  }
  await Role.findAll(params).then(res => {
    ctx.body = {
      message: '查询成功',
      code: 1,
      data: res,
      count
    }
  }, err => {
     ctx.response.status = 500
  })
})


router.post('/user/role/add', async (ctx,next)=>{
  let data = ctx.request.body
  await Role.create(data).then(res => {
    ctx.body = {
      message: '添加成功',
      code: 1
    }
  }, err => {
    ctx.body = {
      message: '添加失败',
      code: -1
    }
  })
})


router.post('/user/role/update', async (ctx,next)=>{
  let data = ctx.request.body
  await Role.update(data, {
    where: {
      id: data.id
    }
  }).then(res => {
    ctx.body = {
      message: '修改成功',
      code: 1
    }
  }, err => {
    ctx.body = {
      message: '修改失败',
      code: -1
    }
  })
})

module.exports = router