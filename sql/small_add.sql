SET NAMES UTF8;

USE smallsql;

CREATE TABLE `server_cont` (
  `id` int NOT NULL COMMENT '唯一标示'PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(64) NOT NULL COMMENT '内容',
  `type` varchar(1) NOT NULL COMMENT '类型'
);


