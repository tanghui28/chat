set names utf8;
DROP DATABASE IF  EXISTS chat;
CREATE DATABASE chat charset=utf8;
USE chat;
#用户表
CREATE TABLE user(
  user_id INT PRIMARY KEY AUTO_INCREMENT,               
  uname VARCHAR(100) UNIQUE NOT NULL,                 #用户名
  password VARCHAR(128) NOT NULL,                     #密码
  gender BOOL NOT NULL DEFAULT 1,                     #性别
  phone CHAR(11) UNIQUE NOT NULL,                     #手机号
  avatar VARCHAR(255) NOT NULL DEFAULT 'male.png',    #头像
  createdAt BIGINT NOT NULL,                          #账号创建日期
  updatedAt BIGINT NOT NULL,                          #账号更新日期
  forbidden BOOL NOT NULL DEFAULT 0                   #是否被禁言
);
INSERT INTO user VALUES(NULL,'尼古拉斯赵四',md5('123456'),1,'18161046533',DEFAULT,1566954954196,1566954954196,DEFAULT);
INSERT INTO user VALUES(NULL,'TomCat',md5('123456'),1,'13628034076',DEFAULT,1566954954196,1566954954196,DEFAULT);
INSERT INTO user VALUES(NULL,'RoseTin',md5('123456'),1,'13628034077',DEFAULT,1566954954196,1566954954196,DEFAULT);
INSERT INTO user VALUES(NULL,'王重阳',md5('123456'),1,'13628034078',DEFAULT,1566954954196,1566954954196,DEFAULT);
INSERT INTO user VALUES(NULL,'TimCook',md5('123456'),1,'13628034079',DEFAULT,1566954954196,1566954954196,DEFAULT);
#好友关系表
CREATE  TABLE user_friend(
  user_id INT NOT NULL,
  friend_id INT NOT NULL,
  createdAt BIGINT NOT NULL,
  FOREIGN KEY(user_id) REFERENCES user(user_id),
  FOREIGN KEY(friend_id) REFERENCES user(user_id)
);
INSERT INTO user_friend VALUES(1,2,1566954954196),
(1,3,1566954954196),
(1,4,1566954954196),
(1,5,1566954954196);

#用户动态表
CREATE TABLE user_news(
  news_id INT PRIMARY KEY AUTO_INCREMENT,
  news_detail VARCHAR(255) NOT NULL,
  news_img VARCHAR(255) NOT NULL DEFAULT "",
  user_id INT NOT NULL,
  createdAt BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  FOREIGN KEY(user_id) REFERENCES user(user_id)
);
#动态回复表
CREATE TABLE news_reply(
  rid INT PRIMARY KEY AUTO_INCREMENT,
  reply_detail VARCHAR(255) NOT NULL,
  createdAt BIGINT NOT NULL,
  user_id INT NOT NULL,
  news_id INT NOT NULL,
  FOREIGN KEY(news_id) REFERENCES user_news(news_id),
  FOREIGN KEY(user_id) REFERENCES user(user_id)
);