// 加密模块
const crypto = require("crypto");

// token模块
const jwt = require('jsonwebtoken');


//引入 user model
const userModel = require('../model/user');

const IP = require('../getIP');

let fn_isLogin = async(ctx,next)=>{

  let token = ctx.request.body.token;
  // 秘钥
  let secret = "tanghui";
  await jwt.verify(token,secret,async(err,decode)=>{

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
      let userInfo = await userModel.findAll({
        attributes: ['avatar','forbidden','gender','phone','uname','user_id'],
        where: {
          user_id:decode.user_id
        },
        raw: true
      })
      userInfo[0].token = token;
      userInfo[0].avatar = "http://" + IP + ':3000/images/' + userInfo[0].avatar;
      ctx.response.body = JSON.stringify({
        title: '验证token',
        success: true,
        info: '用户已登录',
        data: userInfo[0]
      })
    }

  })

  await next();
}


module.exports = {

  "POST /isLogin": fn_isLogin

}
