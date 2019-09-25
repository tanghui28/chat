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

// const server = require('http').Server(app.callback());

// const userModel = require('./api/model/user');
// // 启动websocket服务
// const io = require('socket.io')(server);
// io.on('connection', async socket => {
//   console.log(socket)
//   const secret = 'tanghui';
//   await jwt.verify(socket.handshake.query.token, secret, async(err,decode) => { 

//     if (!err) { 

//       console.log(decode.user_id);
//       await userModel.update(
//         {
//           online: 1,
//           socketId: socket.id
//         },
//         {
//           where: {
//             'user_id': 1
//           }
//         }
//       ).then(ok => { 
//         console.log(ok)
//       }).catch(err => { 
//         console.log(err)
//       })

//       let res = await userModel.findOne({
//         attributes: ['online', 'socketId'],
//         where: {
//           user_id: decode.user_id
//         },
//         raw:true
//       })
//       console.log(res);


//     }

//   })

//   setInterval(() => {
//     socket.emit('message', [1,2,3])
//   }, 15000);

//   socket.on('connect',data=>{
//     console.log(data)
//   })


//   socket.on('top', data => { 
//     console.log(data)
//   })


//   socket.on('disconnect', data => { 
//     console.log('用户断开连接'+data)
//   })

// })

// server.listen(3000)






app.use(static(__dirname+'/public'))
app.use(bodyParser());                //必须在router之前注册到app对象上
app.use(router.routes());
app.use(cors());
let sp = app.listen(3000);


let list = [];          //在线客户端列表
const WebSocket = require('ws');
const wss = new WebSocket.Server({
  server: sp
})
wss.on('connection', (ws, req) => {
  console.log('已连接');
  list.push(ws);
  console.log(list);
  let params = querystring.parse( req.url.slice(2) );
  // { 
  //   user_id:1
  // }

  // ws.onmessage = (msg) => { 
   
  // }
  ws.on('message', (data) => { 
    
    if (data === "ping") { 
      console.log(data);
      ws.send('ping');
      return;
    }
    data = JSON.parse(data);
    console.log(data);
    // {from:'Client A', to:'Client B', body: 'hello'}

   
  })

  ws.on('close', () => { 
    console.log('用户断开连接')
    _.pull(list, ws);
  })

})





