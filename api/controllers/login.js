// 加密模块
const crypto = require("crypto");

// token模块
const jwt = require('jsonwebtoken');

// 引入 pinyin
const pinyin = require('pinyin');


//处理数据库
// const Sequelize = require('sequelize');


//引入 user model
const userModel = require('../model/user');
// 引入user_friend model
const userFriendModel = require('../model/user_friend');


const IP = require('../getIP');

let getFriendDetail = async friend_id => {

  let friendDetail = await userModel.findAll({
    attributes: ['uname', 'avatar','phone'],
    where: {
      user_id: friend_id
    },
    raw: true
  });
  return friendDetail[0];

}

let getUserFriendList = async user_id => { 

  let friendList = await userFriendModel.findAll({
    attributes: ['friend_id', 'friend_remark', 'friend_message'],
    where: {
      user_id
    },
    raw:true
  })

  let letter = [];
  for (let k = 0; k < friendList.length;k++ ) { 
    let item = friendList[k];
    let friendDetail = await getFriendDetail(item.friend_id);
    friendList[k] = { ...item, ...friendDetail };
    friendList[k].friend_remark = friendList[k].friend_remark === "" ? friendList[k]['uname'] : friendList[k].friend_remark;
    friendList[k].avatar = "http://" + IP + ':3000/images/' + friendList[k].avatar;

    letter.push(
      pinyin(friendList[k].friend_remark.slice(0,1),{style:pinyin.STYLE_FIRST_LETTER})[0][0]
    );


  }

  letter = [...new Set(letter)].sort();


  let result = [];
  letter.forEach((item)=>{
    result.push({
      title:item,
      data:[]
    })
  })

  for(let i = 0; i<result.length; i++){
    friendList.forEach((item)=>{

      let first = pinyin(item.friend_remark.slice(0,1),{style:pinyin.STYLE_FIRST_LETTER})[0][0];

      if(result[i].title == first){

        result[i]['data'].push(item)

      }

    })
  }
  return result;

}


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

  // 查询到存在此用户  签发token
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
    data.avatar = "http://" + IP + ':3000/images/' + data.avatar;
    // 查询好友列表
    await getUserFriendList(data.user_id).then(res => { 
      data.friendList = res;
    });
    
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

