// 加密模块
const crypto = require("crypto");

// token模块
const jwt = require('jsonwebtoken');


//处理数据库
// const Sequelize = require('sequelize');


//引入 user model
const userModel = require('../model/user');


let fn_login = async (ctx, next) => {

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

    let token = jwt.sign({
        user_id: canLogin[0]['dataValues']['user_id'],
        uname: canLogin[0]['dataValues']['uname'],
      },
      secret, {
        expiresIn: 60 * 60 * 24 //过期时间 24小时后
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
      success: false,
      data: null,
      info: '用户名或者密码错误!',
      title: '用户登录'
    });

  }


  await next();

}

module.exports = {

  "POST /login": fn_login

}

