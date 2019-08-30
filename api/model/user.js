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
let userModel = sequelize.define('user',
  {
  user_id: {
    type: Sequelize.INTEGER,
    primaryKey: true
  },
  uname: Sequelize.STRING(100),
  password: Sequelize.STRING(128),
  gender: Sequelize.BOOLEAN,
  phone: Sequelize.STRING(11),
  avatar: Sequelize.STRING(255),
  createdAt: Sequelize.BIGINT,
  updatedAt: Sequelize.BIGINT,
  forbidden: Sequelize.BOOLEAN
  },
  {
  timestamps: false,
  tableName: "user"
  }
);

module.exports = userModel;

