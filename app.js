const Koa = require('koa')
const bodyParser = require('koa-bodyparser')
const app = new Koa()
const session = require('koa-session')
const registerRouter  = require('./routes')
const views = require('koa-views')
const logger = require('koa-logger')
const static = require('koa-static')
const jwtKoa = require('koa-jwt')
// app.keys = ['some secret hurr']


const CONFIG = {
  key: 'koa:sess', /** (string) cookie key (default is koa:sess) */
  /** (number || 'session') maxAge in ms (default is 1 days) */
  /** 'session' will result in a cookie that expires when session/browser is closed */
  /** Warning: If a session cookie is stolen, this cookie will never expire */
  maxAge: 86400000,
  autoCommit: true, /** (boolean) automatically commit headers (default true) */
  overwrite: true, /** (boolean) can overwrite or not (default true) */
  httpOnly: true, /** (boolean) httpOnly or not (default true) */
  signed: true, /** (boolean) signed or not (default true) */
  rolling: false, /** (boolean) Force a session identifier cookie to be set on every response. The expiration is reset to the original maxAge, resetting the expiration countdown. (default is false) */
  renew: false, /** (boolean) renew session when session is nearly expired, so we can always keep user logged in. (default is false)*/
};

/*app
.use(jwtKoa({secret: 'jwt wwxx'}).unless({
    path: [/^\/api\/login/, /^\/api\/user\/add/, /^\/$/] //数组中的路径不需要通过jwt验证
}))*/
// app.use(session(CONFIG, app))
app.use(logger())
app.use(static(__dirname+'/static', { extensions: ['html']}))
app.use(views('views', {
  root: __dirname + '/views',
  map: { html: 'ejs' }
}))

app.use(bodyParser());
app.use(registerRouter());


app.listen(3000, () => {
  console.log('server listen on 3000')
})