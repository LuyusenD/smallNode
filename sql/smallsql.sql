-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2019-05-13 05:38:51
-- 服务器版本： 10.1.37-MariaDB
-- PHP 版本： 7.2.12

SET NAMES UTF8;
DROP DATABASE IF EXISTS smallsql;
CREATE DATABASE smallsql CHARSET=UTF8;

USE smallsql;



/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `smallsql`
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
(1, 'admin', '123456', '10.0.0.46', '7242586@qq.com', 0),
(2, 'alone', '123456', '', '7242586@qq.com', 0),
(3, 'test', '123456', '', '7242586@qq.com', 0);

-- --------------------------------------------------------

--
-- 表的结构 `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL COMMENT '序号',
  `url` varchar(256) NOT NULL COMMENT 'bannerUrl'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(3, '接送机场(Air', 'http://localhost:3000/small1557368459360.png', 1),
(4, '搬家(House', 'http://localhost:3000/small1557368554104.png', 2),
(5, '家具安装(Fur', 'http://localhost:3000/small1557368620618.png', 3),
(6, '清洁服务(Cle', 'http://localhost:3000/small1557368650459.png', 4);

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
('oMp1W472En__RkMFdTLgL6nHENQ8', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEIItiamFh2bicA3XadTKuF62heejzfV4sx5tNibJtgefsyXOFacicLPmrzC3aDicfdH8sBhibjmFRHpzaXw/132', 'Luyusen', 1, ''),
('oMp1W472En__RkMFdTLgL6nHENQ8', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEIItiamFh2bicA3XadTKuF62heejzfV4sx5tNibJtgefsyXOFacicLPmrzC3aDicfdH8sBhibjmFRHpzaXw/132', 'Luyusen', 1, '');

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
(1, '小型车', 888),
(2, '微型车', 88),
(3, '紧凑车型', 99),
(4, '中等车型', 128),
(5, '高级车型', 168),
(6, '豪华车型', 288),
(7, 'CDV车型', 388),
(8, 'SUV等车型', 988);

--
-- 转储表的索引
--

--
-- 表的索引 `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- 表的索引 `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `serve`
--
ALTER TABLE `serve`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `the_order`
--
ALTER TABLE `the_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `oId` (`oId`);

--
-- 表的索引 `vehicle_type`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号', AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号';

--
-- 使用表AUTO_INCREMENT `serve`
--
ALTER TABLE `serve`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `the_order`
--
ALTER TABLE `the_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号';

--
-- 使用表AUTO_INCREMENT `vehicle_type`
--
ALTER TABLE `vehicle_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
