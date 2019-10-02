set names utf8;
DROP DATABASE IF  EXISTS chat;
CREATE DATABASE chat charset=utf8mb4;
USE chat;
#用户表
CREATE TABLE user(
  user_id INT PRIMARY KEY AUTO_INCREMENT,               
  uname CHAR(8) UNIQUE NOT NULL,                      #用户名
  password VARCHAR(128) NOT NULL,                     #密码
  gender BOOL NOT NULL DEFAULT 1,                     #性别
  phone CHAR(11) UNIQUE NOT NULL,                     #手机号
  avatar VARCHAR(255) NOT NULL DEFAULT 'male.png',    #头像
  createdAt BIGINT NOT NULL,                          #账号创建日期
  updatedAt BIGINT NOT NULL,                          #账号更新日期
  forbidden BOOL NOT NULL DEFAULT 0,                  #是否被禁言,
  online BOOL NOT NULL DEFAULT false,                 #是否在线,
  socketId VARCHAR(255) NOT NULL DEFAULT ''           #socketID 在线时有值
);
INSERT INTO user VALUES(NULL,'尼古拉斯赵四',md5('123456'),1,'18161046533','1.jpeg',1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'王呈祥',md5('123456'),1,'13628034076','2.jpg',1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'RoseTin',md5('123456'),1,'13628034077','3.jpeg',1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'王重阳',md5('123456'),1,'13628034078','4.jpeg',1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'TimCook',md5('123456'),1,'13628034079','5.jpg',1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'A小王',md5('123456'),1,'13628034060','6.jpeg',1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'A小唐',md5('123456'),1,'13628034061','7.jpeg',1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'A小阳',md5('123456'),1,'13628034062','8.jpeg',1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'A小平',md5('123456'),1,'13628034063','9.jpeg',1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'B小一',md5('123456'),1,'13628034064','10.jpeg',1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'B小二',md5('123456'),1,'13628034065','11.jpg',1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'B小三',md5('123456'),1,'13628034066','12.jpeg',1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'C小四',md5('123456'),1,'13628034067','13.jpeg',1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'C小都',md5('123456'),1,'13628034022','14.jpeg',1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'C小哦',md5('123456'),1,'13628034023','15.jpg',1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'D小五',md5('123456'),1,'13628034068','16.jpeg',1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'D小六',md5('123456'),1,'13628034069','17.jpeg',1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'E小七',md5('123456'),1,'13628034050','18.jpeg',1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'E小八',md5('123456'),1,'13628034051',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'F小九',md5('123456'),1,'13628034052',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'F王二麻子',md5('123456'),1,'13628034053',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'G狗不理',md5('123456'),1,'13628034054',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'G阿毛',md5('123456'),1,'13628034055',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'H小飞',md5('123456'),1,'13628034056',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'I小通',md5('123456'),1,'13628034057',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'J小股',md5('123456'),1,'13628034058',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'J小和',md5('123456'),1,'13628034059',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'K小丽',md5('123456'),1,'13628034034',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'K小狗',md5('123456'),1,'13628034035',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'L小狗',md5('123456'),1,'13628034036',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'Z小狗1',md5('123456'),1,'13628034037',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'Z小狗2',md5('123456'),1,'13628034038',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'Z小狗3',md5('123456'),1,'13628034039',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'Z小狗4',md5('123456'),1,'13628034012',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'Z小狗5',md5('123456'),1,'13628034013',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'Z小狗6',md5('123456'),1,'13628034014',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'测试',md5('123456'),1,'13628034015',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'test',md5('123456'),1,'13628134016',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'test2',md5('123456'),1,'13628234017',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'test3',md5('123456'),1,'13628334018',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'test4',md5('123456'),1,'13628434019',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'test5',md5('123456'),1,'13628534020',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'test6',md5('123456'),1,'13628634021',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'test7',md5('123456'),1,'13628734022',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'test8',md5('123456'),1,'13628834023',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'test9',md5('123456'),1,'13628934024',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'z钟两',md5('123456'),1,'13638034025',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'z肖固',md5('123456'),1,'13648034026',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'z小李1',md5('123456'),1,'13648074027',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'z小李2',md5('123456'),1,'13348074028',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'z小李3',md5('123456'),1,'13648074028',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'z小李4',md5('123456'),1,'13648074030',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'z小李5',md5('123456'),1,'13648074031',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'z小李6',md5('123456'),1,'13648074032',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'z小李7',md5('123456'),1,'13648074033',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'z小李8',md5('123456'),1,'13648074034',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'z小李9',md5('123456'),1,'13648074035',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'z小李10',md5('123456'),1,'13648074036',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'z小李11',md5('123456'),1,'13648074037',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'z小李12',md5('123456'),1,'13648074038',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'z小李13',md5('123456'),1,'13648074039',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'z小李14',md5('123456'),1,'13648074040',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO user VALUES(NULL,'z小李22',md5('123456'),1,'13648074041',DEFAULT,1566954954196,1566954954196,DEFAULT,DEFAULT,DEFAULT);
#好友关系表
CREATE  TABLE user_friend(
  user_id INT NOT NULL,                                       #用户ID
  friend_id INT NOT NULL,                                     #好友ID
  friend_remark CHAR(8) NOT NULL DEFAULT '',                  #好友的备注
  friend_message VARCHAR(9999) NOT NULL DEFAULT '',           #好友发来的未接受的消息 json字符串 
  createdAt BIGINT NOT NULL,                                  #好友创建时间
  FOREIGN KEY(user_id) REFERENCES user(user_id),
  FOREIGN KEY(friend_id) REFERENCES user(user_id)
);
INSERT INTO user_friend VALUES(1,2,DEFAULT,DEFAULT,1566954954196),
(2,1,DEFAULT,DEFAULT,1566954954196),
(1,3,DEFAULT,DEFAULT,1566954954196),
(3,1,DEFAULT,DEFAULT,1566954954196),
(1,4,DEFAULT,DEFAULT,1566954954196),
(4,1,DEFAULT,DEFAULT,1566954954196),
(1,5,DEFAULT,DEFAULT,1566954954196),
(5,1,DEFAULT,DEFAULT,1566954954196),
(1,6,DEFAULT,DEFAULT,1566954954196),
(6,1,DEFAULT,DEFAULT,1566954954196),
(1,7,DEFAULT,DEFAULT,1566954954196),
(7,1,DEFAULT,DEFAULT,1566954954196),
(1,8,DEFAULT,DEFAULT,1566954954196),
(8,1,DEFAULT,DEFAULT,1566954954196),
(1,9,DEFAULT,DEFAULT,1566954954196),
(9,1,DEFAULT,DEFAULT,1566954954196),
(1,10,DEFAULT,DEFAULT,1566954954196),
(10,1,DEFAULT,DEFAULT,1566954954196),
(1,11,DEFAULT,DEFAULT,1566954954196),
(11,1,DEFAULT,DEFAULT,1566954954196),
(1,12,DEFAULT,DEFAULT,1566954954196),
(12,1,DEFAULT,DEFAULT,1566954954196),
(1,13,DEFAULT,DEFAULT,1566954954196),
(13,1,DEFAULT,DEFAULT,1566954954196),
(1,14,DEFAULT,DEFAULT,1566954954196),
(14,1,DEFAULT,DEFAULT,1566954954196),
(1,15,DEFAULT,DEFAULT,1566954954196),
(15,1,DEFAULT,DEFAULT,1566954954196),
(1,16,DEFAULT,DEFAULT,1566954954196),
(16,1,DEFAULT,DEFAULT,1566954954196),
(1,17,DEFAULT,DEFAULT,1566954954196),
(17,1,DEFAULT,DEFAULT,1566954954196),
(1,18,DEFAULT,DEFAULT,1566954954196),
(18,1,DEFAULT,DEFAULT,1566954954196),
(1,19,DEFAULT,DEFAULT,1566954954196),
(19,1,DEFAULT,DEFAULT,1566954954196),
(1,20,DEFAULT,DEFAULT,1566954954196),
(20,1,DEFAULT,DEFAULT,1566954954196),
(1,21,DEFAULT,DEFAULT,1566954954196),
(21,1,DEFAULT,DEFAULT,1566954954196),
(1,22,DEFAULT,DEFAULT,1566954954196),
(22,1,DEFAULT,DEFAULT,1566954954196),
(1,23,DEFAULT,DEFAULT,1566954954196),
(23,1,DEFAULT,DEFAULT,1566954954196),
(1,24,DEFAULT,DEFAULT,1566954954196),
(24,1,DEFAULT,DEFAULT,1566954954196),
(1,25,DEFAULT,DEFAULT,1566954954196),
(25,1,DEFAULT,DEFAULT,1566954954196),
(1,26,DEFAULT,DEFAULT,1566954954196),
(26,1,DEFAULT,DEFAULT,1566954954196),
(1,27,DEFAULT,DEFAULT,1566954954196),
(27,1,DEFAULT,DEFAULT,1566954954196),
(1,28,DEFAULT,DEFAULT,1566954954196),
(28,1,DEFAULT,DEFAULT,1566954954196),
(1,29,DEFAULT,DEFAULT,1566954954196),
(29,1,DEFAULT,DEFAULT,1566954954196),
(1,30,DEFAULT,DEFAULT,1566954954196),
(30,1,DEFAULT,DEFAULT,1566954954196),
(1,31,DEFAULT,DEFAULT,1566954954196),
(31,1,DEFAULT,DEFAULT,1566954954196),
(1,32,DEFAULT,DEFAULT,1566954954196),
(32,1,DEFAULT,DEFAULT,1566954954196),
(1,33,DEFAULT,DEFAULT,1566954954196),
(33,1,DEFAULT,DEFAULT,1566954954196),
(1,34,DEFAULT,DEFAULT,1566954954196),
(34,1,DEFAULT,DEFAULT,1566954954196),
(1,35,DEFAULT,DEFAULT,1566954954196),
(35,1,DEFAULT,DEFAULT,1566954954196),
(1,36,DEFAULT,DEFAULT,1566954954196),
(36,1,DEFAULT,DEFAULT,1566954954196),
(1,37,DEFAULT,DEFAULT,1566954954196),
(37,1,DEFAULT,DEFAULT,1566954954196),
(1,38,DEFAULT,DEFAULT,1566954954196),
(38,1,DEFAULT,DEFAULT,1566954954196),
(1,39,DEFAULT,DEFAULT,1566954954196),
(39,1,DEFAULT,DEFAULT,1566954954196),
(1,40,DEFAULT,DEFAULT,1566954954196),
(40,1,DEFAULT,DEFAULT,1566954954196),
(2,3,DEFAULT,DEFAULT,1566954954196),
(3,2,DEFAULT,DEFAULT,1566954954196),
(2,4,DEFAULT,DEFAULT,1566954954196),
(4,2,DEFAULT,DEFAULT,1566954954196),
(2,5,DEFAULT,DEFAULT,1566954954196),
(5,2,DEFAULT,DEFAULT,1566954954196),
(2,6,DEFAULT,DEFAULT,1566954954196),
(6,2,DEFAULT,DEFAULT,1566954954196),
(2,7,DEFAULT,DEFAULT,1566954954196),
(7,2,DEFAULT,DEFAULT,1566954954196),
(2,8,DEFAULT,DEFAULT,1566954954196),
(8,2,DEFAULT,DEFAULT,1566954954196),
(2,9,DEFAULT,DEFAULT,1566954954196),
(9,2,DEFAULT,DEFAULT,1566954954196),
(2,10,DEFAULT,DEFAULT,1566954954196),
(10,2,DEFAULT,DEFAULT,1566954954196),
(2,11,DEFAULT,DEFAULT,1566954954196),
(11,2,DEFAULT,DEFAULT,1566954954196),
(2,12,DEFAULT,DEFAULT,1566954954196),
(12,2,DEFAULT,DEFAULT,1566954954196),
(2,13,DEFAULT,DEFAULT,1566954954196),
(13,2,DEFAULT,DEFAULT,1566954954196),
(2,14,DEFAULT,DEFAULT,1566954954196),
(14,2,DEFAULT,DEFAULT,1566954954196),
(2,15,DEFAULT,DEFAULT,1566954954196),
(15,2,DEFAULT,DEFAULT,1566954954196),
(2,16,DEFAULT,DEFAULT,1566954954196),
(16,2,DEFAULT,DEFAULT,1566954954196),
(2,17,DEFAULT,DEFAULT,1566954954196),
(17,2,DEFAULT,DEFAULT,1566954954196),
(2,18,DEFAULT,DEFAULT,1566954954196),
(18,2,DEFAULT,DEFAULT,1566954954196),
(2,19,DEFAULT,DEFAULT,1566954954196),
(19,2,DEFAULT,DEFAULT,1566954954196),
(2,20,DEFAULT,DEFAULT,1566954954196),
(20,2,DEFAULT,DEFAULT,1566954954196),
(1,21,DEFAULT,DEFAULT,1566954954196),
(21,2,DEFAULT,DEFAULT,1566954954196),
(2,22,DEFAULT,DEFAULT,1566954954196),
(22,2,DEFAULT,DEFAULT,1566954954196),
(2,23,DEFAULT,DEFAULT,1566954954196),
(23,2,DEFAULT,DEFAULT,1566954954196),
(2,24,DEFAULT,DEFAULT,1566954954196),
(24,2,DEFAULT,DEFAULT,1566954954196),
(2,25,DEFAULT,DEFAULT,1566954954196),
(25,2,DEFAULT,DEFAULT,1566954954196),
(2,26,DEFAULT,DEFAULT,1566954954196),
(26,2,DEFAULT,DEFAULT,1566954954196),
(2,27,DEFAULT,DEFAULT,1566954954196),
(27,2,DEFAULT,DEFAULT,1566954954196),
(2,28,DEFAULT,DEFAULT,1566954954196),
(28,2,DEFAULT,DEFAULT,1566954954196),
(2,29,DEFAULT,DEFAULT,1566954954196),
(29,2,DEFAULT,DEFAULT,1566954954196),
(2,30,DEFAULT,DEFAULT,1566954954196),
(30,2,DEFAULT,DEFAULT,1566954954196),
(2,31,DEFAULT,DEFAULT,1566954954196),
(31,2,DEFAULT,DEFAULT,1566954954196),
(2,32,DEFAULT,DEFAULT,1566954954196),
(32,2,DEFAULT,DEFAULT,1566954954196),
(2,33,DEFAULT,DEFAULT,1566954954196),
(33,2,DEFAULT,DEFAULT,1566954954196),
(2,34,DEFAULT,DEFAULT,1566954954196),
(34,2,DEFAULT,DEFAULT,1566954954196),
(2,35,DEFAULT,DEFAULT,1566954954196),
(35,2,DEFAULT,DEFAULT,1566954954196),
(2,36,DEFAULT,DEFAULT,1566954954196),
(36,2,DEFAULT,DEFAULT,1566954954196),
(2,37,DEFAULT,DEFAULT,1566954954196),
(37,2,DEFAULT,DEFAULT,1566954954196),
(2,38,DEFAULT,DEFAULT,1566954954196),
(38,2,DEFAULT,DEFAULT,1566954954196),
(2,39,DEFAULT,DEFAULT,1566954954196),
(39,2,DEFAULT,DEFAULT,1566954954196),
(2,40,DEFAULT,DEFAULT,1566954954196),
(40,2,DEFAULT,DEFAULT,1566954954196);



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