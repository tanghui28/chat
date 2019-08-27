SET NAMES utf8;
DROP DATABASE IF  EXISTS chat;
CREATE DATABASE chat CHARSET=UTF8;
USE chat;
#用户表
CREATE TABLE user(
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(100) UNIQUE NOT NULL,
  gender BOOL NOT NULL DEFAULT 1,
  phone CHAR(11) NOT NULL,
  avatar VARCHAR NOT NULL DEFAULT 'male.png',
  createdAt BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL
)
INSERT INTO USER VALUES(NULL,'尼古拉斯赵四')
#好友关系表
CREATE  TABLE user_friend(
  user_id INT NOT NULL,
  friend_id INT NOT NULL,
  createdAt BIGINT NOT NULL,
  FOREIGN KEY(user_id) REFERENCES user(user_id),
  FOREIGN KEY(friend_id) REFERENCES user(user_id)
)
#用户动态表
CREATE TABLE user_news(
  news_id INT PRIMARY KEY AUTO_INCREMENT,
  news_detail VARCHAR(255) NOT NULL,
  news_img VARCHAR(255) NOT NULL DEFAULT "",
  user_id INT NOT NULL,
  createdAt BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  FOREIGN KEY(user_id) REFERENCES user(user_id)
)
#动态回复表
CREATE TABLE news_reply(
  rid INT PRIMARY KEY AUTO_INCREMENT,
  reply_detail VARCHAR(255) NOT NULL,
  createdAt BIGINT NOT NULL,
  user_id INT NOT NULL,
  news_id INT NOT NULL,
  FOREIGN KEY(news_id) REFERENCES user_news(news_id),
  FOREIGN KEY(user_id) REFERENCES user(user_id)
)