const Router = require('koa-router')
const router = new Router()
const jwt = require('jsonwebtoken')
const util = require('util')
const verify = util.promisify(jwt.verify)
const secret = 'jwt wwxx'
const Dept = require('../model/dept')
router.prefix('/api')
const sequelize = require('sequelize')
const Op = sequelize.Op

router.get('/department/selectAll', async (ctx,next)=>{
  await Dept.findAll().then(res => {
    ctx.body = {
      message: '查询成功',
      code: 1,
      data: {
      	row: res
      },
      success: true
    }
  }, err => {
    ctx.body = {
      message: '查询失败',
      code: -1,
      success: false
    }
  })
})


router.post('/department/create', async (ctx,next)=>{
  let data = ctx.request.body
  await Dept.create(data).then(res => {
    ctx.body = {
      message: '添加成功',
      code: 1,
      success: true
    }
  }, err => {
    ctx.body = {
      message: '添加失败',
      code: -1,
      success: false
    }
  })
})

router.put('/department/edit', async (ctx,next)=>{
  let data = ctx.request.body
  await Dept.update(data,{
    where: {
      departmentId: data.departmentId
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


router.delete('/department/delete', async (ctx,next)=>{
  let data = ctx.request.body
  let arr = []
  if (typeof data.ids === 'number') {
    arr.push(data.ids)
  } else {
     arr.concat(data.ids.split(','))
  }
  await Dept.destroy({
    where: {
      departmentId: {
        [Op.in]: arr
      }
    }
  }).then(res => {
    ctx.body = {
      message: '删除成功',
      code: 1,
      success: true
    }
  }, err => {
    ctx.body = {
      message: '删除失败',
      code: -1,
      success: false
    }
  })
})
module.exports = router