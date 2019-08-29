const koa = require('koa');

// 集中处理url get 或 post 模块
const router = require('koa-router')();

// 加密模块
const crypto = require("crypto");

// token模块
const jwt = require('jsonwebtoken');

// 允许跨域模块
const cors = require('koa2-cors');  

//处理解析post请求的 请求主体
const bodyParser = require('koa-bodyparser');

//处理数据库
const Sequelize = require('sequelize');
const config = require('./config');
let sequelize = new Sequelize(config.database, config.username, config.password, {
  host: config.host,
  dialect: 'mysql',
  pool: {
    max: 10,
    min: 0,
    idle: 30000
  }
})
// 定义user模型
let userModel = sequelize.define('user',
  {
    user_id: {
      type: Sequelize.INTEGER,
      primaryKey:true
    },
    uname :Sequelize.STRING(100), 
    password: Sequelize.STRING(128),
    gender: Sequelize.BOOLEAN,
    phone: Sequelize.STRING(11),
    avatar: Sequelize.STRING(255),
    createdAt:Sequelize.BIGINT,
    updatedAt: Sequelize.BIGINT,
    forbidden: Sequelize.BOOLEAN
  },
  {
    timestamps: false,
    tableName: "user"
  }
)


// 启动服务
const app = new koa();

router.post('/login', async (ctx, next) => { 

  let uname = ctx.request.body.uname || "",
    password = ctx.request.body.password || "";
  
  let md5 = crypto.createHash('md5');
  
  // 数据库查询
  let canLogin = await userModel.findAll({
    attributes: ['user_id', 'uname', 'gender', 'phone', 'avatar', 'forbidden'],
    where: {
      uname: uname,
      password: md5.update(password).digest('hex')
    }
  })

  // 查询到存在此用户  开始签发token
  if (canLogin.length > 0) {

    // 秘钥
    let secret = "tanghui";

    let token = jwt.sign(
      {
        user_id: canLogin[0]['dataValues']['user_id'],
        uname: canLogin[0]['dataValues']['uname'],
      },
      secret,
      {
        expiresIn: 60 * 60 * 24    //过期时间 24小时后
      }
    );
    let data = canLogin[0]['dataValues'];
    data.token = token;
    ctx.response.body = JSON.stringify({
      success: true,
      data: data,
      info: '登录成功!',
      title: '用户登录'
    });

  } else { 

    ctx.response.body = JSON.stringify({
      success:  false,
      data: null,
      info: '用户名或者密码错误!',
      title:'用户登录'
    });

  }


  await next();

})


app.use(bodyParser());    //必须在router之前注册到app对象上
app.use(router.routes());
app.use(cors());
app.listen(3000);