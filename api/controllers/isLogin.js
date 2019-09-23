// 加密模块
const crypto = require("crypto");

// token模块
const jwt = require('jsonwebtoken');


//引入 user model
const userModel = require('../model/user');


let fn_isLogin = async(ctx,next)=>{

  let token = ctx.request.body.token;
  // 秘钥
  let secret = "tanghui";
  jwt.verify(token,secret,(err,decode)=>{

    if(err){  //时间过期或者伪造token
      // console.log(err)

      ctx.response.body = JSON.stringify({
        title: '验证token',
        success: false,
        info: '用户未登录',
        data: null
      })
    }else{
      // console.log(decode)

      ctx.response.body = JSON.stringify({
        title: '验证token',
        success: true,
        info: '用户已登录',
        data: null
      })
    }

  })

  await next();
}


module.exports = {

  "POST /isLogin": fn_isLogin

}
