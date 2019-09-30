// 加密模块
const crypto = require("crypto");

// token模块
const jwt = require('jsonwebtoken');

// 引入 pinyin
const pinyin = require('pinyin');

//引入 user model
const userModel = require('../model/user');
// 引入user_friend model
const userFriendModel = require('../model/user_friend');


const IP = require('../getIP');

let getFriendDetail = async friend_id => {

  let friendDetail = await userModel.findAll({
    attributes: ['uname', 'avatar', 'phone'],
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
    raw: true
  })

  await userFriendModel.update({
    friend_message:''
  }, {
      where: {
        user_id
      }
  })

  let letter = [];
  for (let k = 0; k < friendList.length; k++) {
    let item = friendList[k];
    let friendDetail = await getFriendDetail(item.friend_id);
    friendList[k] = { ...item, ...friendDetail };
    friendList[k].friend_remark = friendList[k].friend_remark === "" ? friendList[k]['uname'] : friendList[k].friend_remark;
    friendList[k].avatar = "http://" + IP + ':3000/images/' + friendList[k].avatar;

    letter.push(
      pinyin(friendList[k].friend_remark.slice(0, 1), { style: pinyin.STYLE_FIRST_LETTER })[0][0].toUpperCase()
    );


  }

  letter = [...new Set(letter)].sort();


  let result = [];
  letter.forEach((item) => {
    result.push({
      title: item,
      data: []
    })
  })

  for (let i = 0; i < result.length; i++) {
    friendList.forEach((item) => {

      let first = pinyin(item.friend_remark.slice(0, 1), { style: pinyin.STYLE_FIRST_LETTER })[0][0].toUpperCase();

      if (result[i].title == first) {

        result[i]['data'].push(item)

      }

    })
  }
  return result;

}


let fn_friendList = async (ctx, next) => { 
  
  let token = ctx.request.header.token;
  // console.log(token);
  if (token) {

    // 秘钥
    let secret = "tanghui";

    await jwt.verify(token, secret,  async(err, decode) => {

      if (err) {  //时间过期或者伪造token
        console.log('错误')
        ctx.response.body = JSON.stringify({
          title: '获取好友列表',
          success: false,
          info: 'token验证错误',
          data: null
        })
      } else {
        // { 
        //   exp: 1569287734
        //   iat: 1569201334
        //   uname: "尼古拉斯赵四"
        //   user_id: 1
        // }
        // 查询好友列表
        let data = [];
        await getUserFriendList(decode.user_id).then(res => { 
          data = res;
         
        }).catch(err => { 
          console.log(23232323)
          console.log(err)
        });

        ctx.response.body = JSON.stringify({
          title: '获取好友列表',
          success: true,
          info: '获取好友列表成功',
          data: data
        })

       
      }

    })



  } else { 
    console.log('无token');
    ctx.response.body = JSON.stringify({
      title: '获取好友列表',
      success: false,
      data: null,
      info: 'token验证错误'
    })

  }


  await next();

}


module.exports = {

  "POST /friendList": fn_friendList

}