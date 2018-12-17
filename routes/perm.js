const Router = require('koa-router')
const router = new Router()
const jwt = require('jsonwebtoken')
const util = require('util')
const verify = util.promisify(jwt.verify)
const secret = 'jwt wwxx'
const Permission = require('../model/permission').Permission
router.prefix('/api')
const sequelize = require('sequelize')
const Op = sequelize.Op

router.get('/permission/list', async (ctx,next)=>{
  let {offset, limit} = ctx.request.query
  if (offset && limit) {
    let count = -1
    await Permission.find({
      attributes: [[sequelize.fn('COUNT', sequelize.col('*')), 'count']]
    }).then(res => {
      count = JSON.parse(JSON.stringify(res)).count
    })
    await Permission.findAll({offset: offset * limit, limit: ~~limit}).then(res => {
      ctx.body = {
        message: '查询成功',
        code: 1,
        data: {
          row: res,
          count
        }
      }
    }, err => {
       console.log(err)
       ctx.response.status = 500
    })
  } else {
    await Permission.findAll().then(res => {
      ctx.body = {
        message: '查询成功',
        code: 1,
        data: {
          row: res
        }
      }
    }, err => {
       console.log(err)
       ctx.response.status = 500
    })
  }
})

router.post('/permission/create', async (ctx,next)=>{
  let data = ctx.request.body
  await Permission.create(data).then(res => {
    ctx.body = {
      message: '添加成功',
      code: 1,
      success: true
    }
  }, err => {
    console.log(err)
    ctx.body = {
      message: '添加失败',
      code: -1,
      success: false
    }
  })
})

router.put('/permission/update', async (ctx,next)=>{
  let data = ctx.request.body
  await Permission.update(data,{
    where: {
      permissionId: data.permissionId
    }
  }).then(res => {
    ctx.body = {
      message: '修改成功',
      code: 1,
      success: true
    }
  }, err => {
    ctx.body = {
      message: '修改失败',
      code: -1,
      success: false
    }
  })
})

router.delete('/permission/delete', async (ctx,next)=>{
  let {permissionId} = ctx.request.body
  await Permission.destroy({
    where: {
      permissionId
    }
  }).then(res => {
    ctx.body = {
      message: '删除成功',
      code: 1,
      success: true
    }
  }, err => {
    console.log(err)
    ctx.body = {
      message: '删除失败',
      code: -1,
      success: false
    }
  })
})
module.exports = router