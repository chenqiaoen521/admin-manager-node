const Router = require('koa-router')
const router = new Router()

router.get('/', async (ctx,next)=>{
  await ctx.render('login',{
  	title: 'LOGIN'
  })
})

module.exports = router