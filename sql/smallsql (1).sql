-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2019-05-06 04:24:14
-- 服务器版本： 5.6.41
-- PHP Version: 5.5.38
SET NAMES UTF8;
DROP DATABASE IF EXISTS smallsql;
CREATE DATABASE smallsql CHARSET=UTF8;

USE smallsql;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smallsql`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL COMMENT '序号',
  `username` varchar(16) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `ip` varchar(64) DEFAULT NULL COMMENT 'ip地址',
  `email` varchar(128) NOT NULL COMMENT '邮箱',
  `login` int(11) DEFAULT '0' COMMENT '登录数量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `ip`, `email`, `login`) VALUES
(1, 'admin', '123456', NULL, '7242586@qq.com', 0);

-- --------------------------------------------------------

--
-- 表的结构 `serve`
--

CREATE TABLE `serve` (
  `id` int(11) NOT NULL COMMENT '编号',
  `name` varchar(8) NOT NULL COMMENT '服务名称',
  `icon` varchar(256) NOT NULL COMMENT '服务icon',
  `money` int(11) NOT NULL COMMENT '价格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `serve`
--

INSERT INTO `serve` (`id`, `name`, `icon`, `money`) VALUES
(1, '接机', 'https://89655027.ngrok.io/small1557104917146.png', 11),
(2, '送机', 'https://89655027.ngrok.io/small1557104930016.png', 11),
(3, '包车旅游', 'https://89655027.ngrok.io/small1557104943744.png', 11),
(4, '小件搬家', 'https://89655027.ngrok.io/small1557104958389.png', 11);

-- --------------------------------------------------------

--
-- 表的结构 `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL COMMENT '编号',
  `name` varchar(8) NOT NULL COMMENT '状态名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `state`
--

INSERT INTO `state` (`id`, `name`) VALUES
(1, '未付款'),
(2, '已付款'),
(3, '执行中'),
(4, '完成');

-- --------------------------------------------------------

--
-- 表的结构 `the_order`
--

CREATE TABLE `the_order` (
  `id` int(11) NOT NULL COMMENT '编号',
  `oId` varchar(128) NOT NULL COMMENT '订单编号',
  `oName` varchar(32) NOT NULL COMMENT '姓名',
  `oTel` varchar(14) NOT NULL COMMENT '联系方式',
  `oAddress` varchar(64) NOT NULL COMMENT '地址',
  `createTime` varchar(16) NOT NULL COMMENT '创建时间',
  `deleteTime` varchar(16) NOT NULL COMMENT '订单取消时间',
  `oType` int(11) NOT NULL COMMENT '服务类型',
  `oState` int(11) NOT NULL COMMENT '订单状态',
  `oVehicle` int(11) DEFAULT NULL COMMENT '汽车类型',
  `oTime` varchar(16) NOT NULL COMMENT '预约时间',
  `oRemark` varchar(128) NOT NULL COMMENT '备注',
  `openId` varchar(128) NOT NULL COMMENT '唯一标示',
  `md5` varchar(128) NOT NULL COMMENT '订单密文',
  `evaluate` varchar(128) DEFAULT NULL COMMENT '评价',
  `score` varchar(8) DEFAULT NULL COMMENT '评分'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `the_order`
--

INSERT INTO `the_order` (`id`, `oId`, `oName`, `oTel`, `oAddress`, `createTime`, `deleteTime`, `oType`, `oState`, `oVehicle`, `oTime`, `oRemark`, `openId`, `md5`, `evaluate`, `score`) VALUES
(1, 'Z2420190561021557108169358', '1', '+8617603021918', '广东省深圳市罗湖区文锦中路1008号', '1557108169358', '0', 2, 1, 1, '1557108169328', '1111', 'oMp1W41VcjNBIKSDDXw92zbf2cUc', '5df7bd263625b7564c03e29f698b2bc0xn', NULL, NULL),
(2, 'Z24201905610131557108824776', '1', '+8617603021918', '广东省深圳市罗湖区文锦中路1008号', '1557108824776', '0', 2, 1, 1, '1557108824752', '111', 'oMp1W41VcjNBIKSDDXw92zbf2cUc', '4961211ca2f4ba47f2c77f4afeb05338xn', NULL, NULL),
(3, 'Z24201905610141557108855259', '17', '+6117603021918', '广东省深圳市罗湖区文锦', '1557108855259', '0', 1, 1, 1, '1557108855230', '111', 'oMp1W41VcjNBIKSDDXw92zbf2cUc', '03052f83cce2b2b7f633729b7a71e105xn', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `openId` varchar(128) NOT NULL COMMENT '唯一标示',
  `img` varchar(256) NOT NULL COMMENT '头像',
  `name` varchar(8) NOT NULL COMMENT '用户名',
  `sex` int(11) NOT NULL COMMENT '性别',
  `address` varchar(64) NOT NULL COMMENT '地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`openId`, `img`, `name`, `sex`, `address`) VALUES
('oMp1W41VcjNBIKSDDXw92zbf2cUc', 'https://wx.qlogo.cn/mmopen/vi_32/xY2kmIGqa7W1A4a1g96uFf6VicNGSyRNaY545mFlVyibtib1rycibwx6jn5hicftap7FMnpZ67DEgBswNv44Mfjuia9g/132', '?烂好人', 1, 'Shenzhen');

-- --------------------------------------------------------

--
-- 表的结构 `vehicle_type`
--

CREATE TABLE `vehicle_type` (
  `id` int(11) NOT NULL COMMENT '编号',
  `name` varchar(32) NOT NULL COMMENT '车型',
  `money` int(11) NOT NULL COMMENT '价格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vehicle_type`
--

INSERT INTO `vehicle_type` (`id`, `name`, `money`) VALUES
(1, '小型车', 66),
(2, '微型车', 88),
(3, '紧凑车型', 99),
(4, '中等车型', 128),
(5, '高级车型', 168),
(6, '豪华车型', 288),
(7, 'CDV车型', 388),
(8, 'SUV等车型', 988);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `serve`
--
ALTER TABLE `serve`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `the_order`
--
ALTER TABLE `the_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `oId` (`oId`);

--
-- Indexes for table `vehicle_type`
--
ALTER TABLE `vehicle_type`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `serve`
--
ALTER TABLE `serve`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `the_order`
--
ALTER TABLE `the_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `vehicle_type`
--
ALTER TABLE `vehicle_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
