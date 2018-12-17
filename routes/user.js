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
var db = require('../model/database')
router.prefix('/api')
const crypto = require("crypto")

router.get('/user', async (ctx,next)=>{
  let cb = ctx.request.query.callback
  ctx.type = 'text'
  ctx.body = cb + '(' + '"数据"' + ')'
})

router.post('/login', async (ctx,next)=>{
  let {username, password} = ctx.request.body
  let md5 = crypto.createHash("md5")
  let newPas = md5.update(password).digest("hex")
  await User.findOne({ where: {username} }).then(res => {
    if (newPas === res.password) {
      let token = jwt.sign({name: username, id: res.id}, secret, {expiresIn: '12h'})  //token签名 有效期为1小时
      ctx.body = {
        message: '登录成功',
        code: 1,
        token
      }
    } else {
      ctx.response.status = 401
    }
  })
})


router.post('/user/add', async (ctx,next)=>{
  debugger
  let {username, password} = ctx.request.body
  let md5 = crypto.createHash("md5")
  let newPas = md5.update(password).digest("hex")
  await User.create({username, 'password': newPas}).then(res => {
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

router.get('/user/del', async (ctx,next)=>{
  let id = ctx.request.query
  await User.destroy({
    where: id
  }).then(res => {
    ctx.body = {
      message: '成功',
      code: 1
    }
  }, err => {
    ctx.body = {
      message: '失败',
      code: -1
    }
  })
  
})

router.get('/user/find', async (ctx,next)=>{
  let user = ctx.request.query
  await User.findOne({where: user}).then(res => {
    if (res) {
      ctx.body = {
        message: '失败',
        code: -1
      }
    } else {
      ctx.body = {
        message: '成功',
        code: 1
      }
    }
  }, err => {
    ctx.body = {
      message: '失败',
      code: -1
    }
  })
  
})

router.get('/user/list', async (ctx,next)=>{
  let {page, limit} = ctx.request.query
  let count = -1
  await User.find({
    attributes: [[sequelize.fn('COUNT', sequelize.col('*')), 'count']]
  }).then(res => {
    count = JSON.parse(JSON.stringify(res)).count
  })
  let offset = (~~page-1) * limit
  await db.query('SELECT u.username, u.id, u.status, u.createdAt ,u.updatedAt, d.department_name as departmentName, d.department_id as departmentId FROM users u left join userdept ud on u.id = ud.id  left join yd_depts d on ud.department_id = d.department_id limit ?, ?', 
  { replacements: [offset, ~~limit] })
  /*await User.findAll({
    attributes: ['id', 'username', 'status', 'createdAt', 'updatedAt'],
    offset, limit: ~~limit
  })*/.then(res => {
    ctx.body = {
      message: '查询成功',
      code: 1,
      data: res[0],
      count
    }
  }, err => {
     ctx.response.status = 500
  })
})

router.get('/user/update/status', async (ctx,next)=>{
  let data = ctx.request.query
  await User.update({status: data.status}, {
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

router.post('/user/update/password', async (ctx,next)=>{
  let data = ctx.request.body
  let md5 = crypto.createHash("md5")
  let newPas = md5.update(data.password).digest("hex")
  await User.update({'password': newPas}, {
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

router.post('/user/update/role', async (ctx,next)=>{
  let data = ctx.request.body
  await User.update(data, {
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

router.get('/login/info', async (ctx,next)=>{
  let token = ctx.request.headers['x-token']
  let code = jwt.decode(token, {secret})
  /*await db.query(`select * from yd_auths a where FIND_IN_SET (a.id, (select r.groupid
 from yd_users u right join yd_roles r on u.yd_role_id = r.id where u.id = ${code.id}))`, { type: sequelize.QueryTypes.SELECT})*/
 await db.query(`select * from yd_perms perm right join (select * from rolepermission where role_id = (SELECT role_id FROM userrole WHERE id = ${code.id})) r on perm.permission_id = r.permission_id`)
  .then(data => {
    ctx.body = {
      message: '成功',
      code: 1,
      name: code.name, 
      data: data[0]
    }
  }, err => {
    ctx.body = {
      message: '失败',
      code: -1
    }
  })
})

router.get('/user/addRole', async (ctx,next)=>{
  let {ids, id} = ctx.request.query
  let str = ''
  let len = ids.length
  let arr = []
  for (let i = 0; i < len; i++) {
    str += '(?,?,?,?),'
    arr.push(id, new Date(), new Date(), ids[i])
  }
  str = str.substring(0, str.length - 1)
  await db.query(`INSERT INTO userrole (id, createdAt, updatedAt, role_id) values ${str} ON DUPLICATE KEY UPDATE id = VALUES(id)`,
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

router.get('/user/getUserByRole', async (ctx,next)=>{
  let {id} = ctx.request.query
  await db.query(`SELECT role_id, role_name from role2 where role_id in (SELECT role_id FROM userrole WHERE id = ?)`,
    { replacements: [id]}
  ).then(res => {
    ctx.body = {
      message: '成功',
      success: true,
      code: 1,
      row: res[0]
    }
  }, err => {
    console.log(err)
    ctx.body = {
      message: '失败',
      success: false,
      code: -1
    }
  })
})

router.delete('/user/delRoleByUser', async (ctx,next)=>{
  let {ids, id} = ctx.request.body
  let str = ''
  let len = ids.length
  let arr = []
  arr.push(id)
  for (let i = 0; i < len; i++) {
    str += '?,'
    arr.push(ids[i])
  }
  str = str.substring(0, str.length - 1)
  await db.query(`DELETE FROM userrole WHERE id = ? and role_id in (${str})`,
    { replacements: arr}
  ).then(res => {
    ctx.body = {
      message: '删除成功',
      success: true,
      code: 1
    }
  }, err => {
    ctx.body = {
      message: '删除失败',
      code: -1
    }
  })
})

router.get('/user/addDept', async (ctx,next)=>{
  let {departmentId, userIds} = ctx.request.query
  let str = ''
  let len = userIds.length
  let arr = []
  for (let i = 0; i < len; i++) {
    str += '(?,?,?,?),'
    arr.push(userIds[i], new Date(), new Date(), departmentId)
  }
  str = str.substring(0, str.length - 1)
  await db.query(`INSERT INTO userdept (id, createdAt, updatedAt, department_id) values ${str} ON DUPLICATE KEY UPDATE id = VALUES(id)`,
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

router.delete('/user/delDeptByUser', async (ctx,next)=>{
  let {departmentId, userId} = ctx.request.body
  let arr = []
  arr.push(userId)
  arr.push(departmentId)
  await db.query('DELETE FROM userdept WHERE id = ? and department_id = ?',
    { replacements: arr}
  ).then(res => {
    ctx.body = {
      message: '删除成功',
      success: true,
      code: 1
    }
  }, err => {
    ctx.body = {
      message: '删除失败',
      code: -1
    }
  })
})

module.exports = router