const koa = require('koa');

// 集中处理url get 或 post
const router = require('koa-router')();

// 允许跨域模块
const cors = require('koa2-cors');  

//处理解析post请求的 请求主体
const bodyParser = require('koa-bodyparser');

const app = new koa();


router.post('/login', async (ctx, next) => { 
  console.log(ctx);
  ctx.response.body = JSON.stringify({
    success: true,
    data:null
  });
  await next();
})


app.use(router.routes());
app.use(cors());
app.listen(3000);