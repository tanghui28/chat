// 数据库 orm 映射模块
const Sequelize = require('sequelize');

const config = require('../config');
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
let userFriendModel = sequelize.define('user_friend',
  {
    user_id: Sequelize.INTEGER,
    friend_id:Sequelize.INTEGER,
    friend_remark:Sequelize.STRING(8),
    friend_message:Sequelize.STRING(9999),
    createdAt: Sequelize.BIGINT,
  },
  {
  timestamps: false,
  tableName: "user_friend"
  }
);

module.exports = userFriendModel;

