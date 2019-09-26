const _ = require('lodash');
const querystring = require('querystring');
// 文件读取模块
const fs = require('fs');
// koa
const koa = require('koa');

// 集中处理url get 或 post 模块
const router = require('koa-router')();

// 加密模块
const crypto = require("crypto");

// token模块
const jwt = require('jsonwebtoken');

// 允许跨域模块
const cors = require('koa2-cors');  

//处理解析post请求的 请求主体 模块
const bodyParser = require('koa-bodyparser');

//处理静态文件模块
const static = require('koa-static');

let userFriendModel = require('./api/model/user_friend');

// 数据库 orm 映射模块
// const Sequelize = require('sequelize');


// 定义添加中间件函数
function addMapping(router,mapping) {

  for (let url in mapping ) { 

    if (url.startsWith('GET')) {

      let path = url.slice(4);
      router.get(path,mapping[url])

    } else if (url.startsWith('POST')) {

      let path = url.slice(5);
      router.post(path, mapping[url])

    }


  }

}


// 定义扫描中间件函数
function addControllers(router) {

  let files = fs.readdirSync(__dirname + '/api/controllers');

  // 过滤非js文件
  let js_files = files.filter(f => {
    return f.endsWith('.js');
  })

  for (let f of js_files) {
    let mapping = require(__dirname + '/api/controllers/' + f);
    addMapping(router,mapping)
  }

}

// 扫描所有api文件并运行
addControllers(router);



// 创建koa服务
const app = new koa();

app.use(static(__dirname+'/public'))
app.use(bodyParser());                //必须在router之前注册到app对象上
app.use(router.routes());
app.use(cors());
let sp = app.listen(3000);




let list = [];          //websocket在线客户端列表
const WebSocket = require('ws');
const wss = new WebSocket.Server({
  server: sp
})
wss.on('connection', (ws, req) => {
  console.log('已连接');
 
  let params = querystring.parse( req.url.slice(2) );
  // { 
  //   user_id:1
  // }

  list[params.user_id] = ws;
  console.log(list);
  ws.on('message', async(data) => { 
    
    if (data === "ping") { 
      // console.log(data);
      ws.send('ping');
      return;
    }
    data = JSON.parse(data);
    console.log(data);
    // {from:1, to:6, body: 'hello'}
    if(list[data.to]){
      console.log(data.to+'用户在线');
      list[data.to].send(JSON.stringify(data));
    }else {
      //用户不在线 , 存储消息
      console.log(data.to+'用户离线,存储消息');
      let res = await userFriendModel.findOne({
        attributes:['friend_message'],
        where:{
          user_id:data.from,
          friend_id:data.to
        }
      })
      let friend_message = res.friend_message+data.body;
      await userFriendModel.update({
        friend_message
      },{
        where:{
          user_id:data.from,
          friend_id:data.to
        }
      })

    }

   
  })

  ws.on('close', () => { 
    console.log('用户断开连接')
    list[params.user_id] = null;
  })

})





