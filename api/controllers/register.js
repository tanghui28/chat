// 加密模块
const crypto = require("crypto");

// token模块
const jwt = require('jsonwebtoken');


//  user model 模块
const userModel = require('../model/user');


let fn_register = async (ctx,next) => { 

  let uname = ctx.request.body.uname || "",
    password = ctx.request.body.password || "",
    phone = ctx.request.body.phone || "";
  
  let phoneReg = /^1[3456789]\d{9}$/;
  
  if (!uname || !password || password.length < 6 || !phoneReg.test(phone)) {
    ctx.response.body = JSON.stringify({
      success: false,
      data: null,
      info: '用户名、密码或手机号码格式错误!',
      title: '用户注册'
    });
  } else { 

    let hasUser = await userModel.findAll({
      attributes: ['user_id'],
      where: {
        uname
      }
    });

    if (hasUser.length > 0) {
      ctx.response.body = JSON.stringify({
        success: false,
        data: null,
        info: '用户名已存在!',
        title: '用户注册'
      });
    } else { 

      let md5 = crypto.createHash('md5');
      let now = Date.now();
      let newUser = await userModel.create({
        user_id: null,
        uname,
        password: md5.update(password).digest('hex'),
        gender: 1,
        phone,
        avatar: "male.png",
        createdAt: now,
        updatedAt: now,
        forbidden: false
      });

      console.log(newUser);
      ctx.response.body = JSON.stringify({
        success: true,
        data: newUser['dataValues']['uname'],
        info: '用户注册成功!',
        title: '用户注册'
      });

    }


  }

  await next();


}

module.exports = {

  "POST /register":fn_register

}