-- Create a new database called 'DatabaseName'
-- Connect to the 'master' database to run this snippet
-- Create the new database if it does not exist already

SET NAMES UTF8;
DROP DATABASE IF EXISTS smallsql;
CREATE DATABASE smallsql CHARSET=UTF8;

USE smallsql;

CREATE TABLE `user` (
  `openId` varchar(128) NOT NULL COMMENT '唯一标示',
  `img` varchar(256) NOT NULL COMMENT '头像',
  `name` varchar(8) NOT NULL COMMENT '用户名',
  `sex` int NOT NULL COMMENT '性别',
  `address` varchar(64) NOT NULL COMMENT '地址'
);

CREATE TABLE `the_order` (
  `id` int NOT NULL COMMENT '编号' PRIMARY KEY AUTO_INCREMENT,
  `oId` varchar(128) NOT NULL COMMENT '订单编号' UNIQUE,
  `oName` varchar(32) NOT NULL COMMENT '姓名',
  `oTel` varchar(14) NOT NULL COMMENT '联系方式',
  `oAddress` varchar(64) NOT NULL COMMENT '地址',
  `createTime` varchar(16) NOT NULL COMMENT '创建时间',
  `deleteTime` varchar(16) NOT NULL COMMENT '订单取消时间',
  `oType` int NOT NULL COMMENT '服务类型',
  `oState` int NOT NULL COMMENT '订单状态',
  `oVehicle` int COMMENT '汽车类型',
  `oTime` varchar(16) NOT NULL COMMENT '预约时间',
  `oRemark` varchar(128) NOT NULL COMMENT '备注',
  `openId` varchar(128) NOT NULL COMMENT '唯一标示',
  `md5` varchar(128) NOT NULL COMMENT '订单密文',
  `evaluate` varchar(128) COMMENT '评价',
  `score` varchar(8) COMMENT '评分'
);

CREATE TABLE `admin` (
  `id` INT NOT NULL COMMENT '序号' PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(16) NOT NULL COMMENT '用户名' UNIQUE,
  `password` varchar(32) NOT NULL COMMENT '密码',
  `ip` varchar(64) COMMENT 'ip地址',
  `email` varchar(128) NOT NULL COMMENT '邮箱',
  `login` int COMMENT '登录数量' default 0
);

CREATE TABLE `serve` (
  `id` INT NOT NULL COMMENT '编号' PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(8) NOT NULL COMMENT '服务名称',
  `icon` varchar(256) NOT NULL COMMENT '服务icon',
  `money` INT NOT NULL COMMENT '价格'
);

CREATE TABLE `state` (
  `id` INT NOT NULL COMMENT '编号' PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(8) NOT NULL COMMENT '状态名称'
);

CREATE TABLE `vehicle_type` (
  `id` INT NOT NULL COMMENT '编号' PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '车型',
  `money` INT NOT NULL COMMENT '价格'
);

INSERT INTO `admin` (`username`,`password`,`email`) VALUES ('admin','123456','7242586@qq.com');

INSERT INTO `state` (`name`) VALUES
('未付款'),
('已付款'),
('执行中'),
('完成');

-- INSERT INTO `serve` (`name`) VALUES
-- ('机场接送'),
-- ('家具安装'),
-- ('清洁服务'),
-- ('搬家');

INSERT INTO `vehicle_type` (`name`,`money`) VALUES
('小型车', 66),
('微型车', 88),
('紧凑车型', 99),
('中等车型', 128),
('高级车型', 168),
('豪华车型', 288),
('CDV车型', 388),
('SUV等车型', 988);

-- INSERT INTO `the_order` (`id`, `oId`, `oName`, `oTel`, `oAddress`, `createTime`, `deleteTime`, `oType`, `oState`, `oTime`, `oRemark`, `openId`) VALUES 
-- (NULL, '13437024352606386584', '郏绮梅', '17075319386', '广东深圳', '0', '0', '1', '0', '0', '测试测试测试测试测试测试测试测试', '0'),
-- (NULL, '45119326794520023590', '许文栋', '15656891377 ', '广东深圳', '0', '0', '1', '0', '0', '测试测试测试测试测试测试测试测试', '0'),
-- (NULL, '53975449004210531849', '杨程', '17602031918', '广东深圳', '0', '0', '1', '0', '0', '测试测试测试测试测试测试测试测试', '0'),
-- (NULL, '94771884121000770580', '赵光', '16902436956', '广东深圳', '0', '0', '1', '0', '0', '测试测试测试测试测试测试测试测试', '0'),
-- (NULL, '61747845155186950881', '宁艳红', '13914275393', '广东深圳', '0', '0', '1', '0', '0', '测试测试测试测试测试测试测试测试', '0'),
-- (NULL, '38915897880215200112', '廖雪冰', '13883599649', '广东深圳', '0', '0', '1', '0', '0', '测试测试测试测试测试测试测试测试', '0');