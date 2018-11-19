const Router = require('koa-router')
const router = new Router()
const jwt = require('jsonwebtoken')
const util = require('util')
const verify = util.promisify(jwt.verify)
const secret = 'jwt wwxx'
const Auth = require('../model/auth')
router.prefix('/api')
const sequelize = require('sequelize')

router.get('/user/li2321313st', async (ctx) => {
    const token = ctx.header.authorization  // 获取jwt
    let payload
    if (token) {
      payload = await verify(token.split(' ')[1], secret)  // // 解密，获取payload
      ctx.body = {
        payload
      }
    } else {
      ctx.body = {
        message: 'token 错误',
        code: -1
      }
    }
  })


router.get('/user/auth/list', async (ctx,next)=>{
  let {page, limit} = ctx.request.query
  let count = -1
  await Auth.find({
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
  await Auth.findAll(params).then(res => {
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

router.post('/user/auth/add', async (ctx,next)=>{
  let data = ctx.request.body
  await Auth.create(data).then(res => {
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


router.post('/user/auth/update', async (ctx,next)=>{
  let data = ctx.request.body
  await Auth.update(data, {
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