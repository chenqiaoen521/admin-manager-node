const Router = require('koa-router')
const router = new Router()
const jwt = require('jsonwebtoken')
const util = require('util')
const verify = util.promisify(jwt.verify)
const secret = 'jwt wwxx'
const Role = require('../model/role')
const Role2 = require('../model/permission').Role2
const Permission = require('../model/permission').Permission
const Auth = require('../model/auth')
const User = require('../model/user')
const sequelize = require('sequelize')
const db = require('../model/database')
const moment = require('moment')
const Op = sequelize.Op
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


router.post('/user/role/create', async (ctx,next)=>{
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



router.get('/role2/list', async (ctx,next)=>{
  let {offset, limit} = ctx.request.query
  let count = -1
  await Role2.find({
    attributes: [[sequelize.fn('COUNT', sequelize.col('*')), 'count']]
  }).then(res => {
    count = JSON.parse(JSON.stringify(res)).count
  })
  let params
  if (offset !== undefined && limit !== undefined) {
    params = {offset: offset * ~~limit, limit: ~~limit}
  } else {
    params = {where: {}}
  }
  await Role2.findAll(params).then(res => {
    ctx.body = {
      message: '查询成功',
      code: 1,
      data: {
        rows: res,
        total: count
      }
    }
  }, err => {
     ctx.response.status = 500
  })
})


router.put('/role2/create', async (ctx,next)=>{
  let data = ctx.request.body
  await Role2.create(data).then(res => {
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

router.get('/role2/addPerm', async (ctx,next)=>{
  let {ids, roleId} = ctx.request.query
  let str = ''
  let len = ids.length
  let arr = []
  for (let i = 0; i < len; i++) {
    str += '(?,?,?,?),'
    arr.push(roleId, ids[i], new Date(), new Date())
  }
  str = str.substring(0, str.length - 1)
  await db.query(`INSERT INTO rolepermission (role_id, permission_id, createdAt, updatedAt) values ${str} ON DUPLICATE KEY UPDATE permission_id = VALUES(permission_id)`,
    { replacements: arr}
  ).then(res => {
    ctx.body = {
      message: '成功',
      success: true,
      code: 1
    }
  }, err => {
    console.log(err)
    ctx.body = {
      message: '添加失败',
      code: -1
    }
  })
})

router.get('/role2/getPermByRole', async (ctx,next)=>{
  let {roleId} = ctx.request.query
  await db.query(`SELECT permission_id, permission_name from yd_perms where permission_id in (SELECT permission_id FROM rolepermission WHERE role_id = ?)`,
    { replacements: [roleId]}
  ).then(res => {
    ctx.body = {
      message: '成功',
      success: true,
      code: 1,
      row: res[0]
    }
  }, err => {
    ctx.body = {
      message: '失败',
      success: false,
      code: -1
    }
  })
})
router.delete('/role2/delPermByRole', async (ctx,next)=>{
  let {ids, roleId} = ctx.request.body
  let str = ''
  let len = ids.length
  let arr = []
  arr.push(roleId)
  for (let i = 0; i < len; i++) {
    str += '?,'
    arr.push(ids[i])
  }
  str = str.substring(0, str.length - 1)
  await db.query(`DELETE FROM rolepermission WHERE role_id = ? and permission_id in (${str})`,
    { replacements: arr}
  ).then(res => {
    ctx.body = {
      message: '成功',
      success: true,
      code: 1
    }
  }, err => {
    ctx.body = {
      message: '添加失败',
      code: -1
    }
  })
})
router.put('/role2/edit', async (ctx,next)=>{
  let data = ctx.request.body
  await Role2.update(data, {
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

router.delete('/role2/delete', async (ctx,next)=>{
  let {roleId} = ctx.request.body
  await Promise.all([db.query(`DELETE FROM role2 WHERE role_id = ?`,
    { replacements: [roleId]}
  ),db.query(`DELETE FROM rolepermission WHERE role_id = ?`,
    { replacements: [roleId]}
  )]).then(res => {
    console.log(res)
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
router.get('/role2/roleByUserId', async (ctx,next)=>{
  
})
module.exports = router