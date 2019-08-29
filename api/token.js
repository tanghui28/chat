// token模块
const jwt = require('jsonwebtoken');

let content = {
  name: '尼古拉斯赵四'
};

let secret = "jack";

let token = jwt.sign(content, secret, {
  expiresIn: 60 * 60 * 1
})

console.log(token);

jwt.verify(token, secret, function (err,decode) { 

  if (!err) { 
    console.log(decode)
  }

})