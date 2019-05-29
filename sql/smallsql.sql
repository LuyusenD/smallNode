-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2019-05-29 09:04:57
-- 服务器版本： 10.1.37-MariaDB
-- PHP 版本： 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


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
(1, 'admin', 'rfdsz9x', '172.18.47.101', '7242586@qq.com', 0);

-- --------------------------------------------------------

--
-- 表的结构 `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL COMMENT '序号',
  `url` varchar(256) NOT NULL COMMENT 'bannerUrl'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `banner`
--

INSERT INTO `banner` (`id`, `url`) VALUES
(2, 'small1558598925310.png');

-- --------------------------------------------------------

--
-- 表的结构 `money`
--

CREATE TABLE `money` (
  `name` varchar(32) NOT NULL,
  `money` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `money`
--

INSERT INTO `money` (`name`, `money`) VALUES
('每小时', 10),
('每公里', 8);

-- --------------------------------------------------------

--
-- 表的结构 `serve`
--

CREATE TABLE `serve` (
  `id` int(11) NOT NULL COMMENT '编号',
  `name` varchar(64) NOT NULL COMMENT '服务名称',
  `icon` varchar(256) NOT NULL COMMENT '服务icon',
  `money` int(11) NOT NULL COMMENT '价格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `serve`
--

INSERT INTO `serve` (`id`, `name`, `icon`, `money`) VALUES
(1, '送机(send to Airport)', 'small1558597354689.png', 100),
(2, '接机(Airport pickup)', 'small1558597379450.png', 98),
(3, '清洁服务(Clean service)', 'small1558597405749.png', 120),
(4, '家具安装(Furniture installa)', 'small1558597440026.png', 500),
(5, '搬家(House-moving) ', 'small1558597461360.png', 1000);

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
  `oTel` varchar(32) NOT NULL COMMENT '联系方式',
  `startAddress` varchar(64) NOT NULL COMMENT '起始地点',
  `endAddress` varchar(64) NOT NULL COMMENT '终始地点',
  `kilometre` int(11) NOT NULL COMMENT '公里',
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

INSERT INTO `the_order` (`id`, `oId`, `oName`, `oTel`, `startAddress`, `endAddress`, `kilometre`, `createTime`, `deleteTime`, `oType`, `oState`, `oVehicle`, `oTime`, `oRemark`, `openId`, `md5`, `evaluate`, `score`) VALUES
(1, 'Z242019052416341558686885576', '1', '+8617603021918', '广东省深圳市福田区福中三路', '悉尼机场', 3275, '1558686885576', '0', 1, 1, 1, '1558686880596', '111', 'oMp1W41VcjNBIKSDDXw92zbf2cUc', '907ddb0b1be368643137f5e32afdf138xn', NULL, NULL),
(2, 'Z242019052416441558687440457', '11', '+8617603021918', '广东省深圳市福田区福中三路市民中心C区', '悉尼机场', 3275, '1558687440457', '0', 1, 1, 1, '1558687435470', '111', 'oMp1W41VcjNBIKSDDXw92zbf2cUc', 'b6a8404b2c36dd1b3e32cd60ee495f2fxn', NULL, NULL),
(3, 'Z242019052613171558847877517', '11', '+8617603021918', '广东省深圳市福田区福中三路', '广东省深圳市福田区福中三路', 0, '1558847877517', '0', 3, 1, 1, '1558847876692', '11', 'oMp1W41VcjNBIKSDDXw92zbf2cUc', '29b5a2a091a892042e1d7caa6ec90e7bxn', NULL, NULL),
(4, 'Z242019052613201558848051254', '11', '+8617603021981', '广东省深圳市福田区福中三路', '爱华隆机场', 3061, '1558848051254', '0', 1, 1, 1, '1558848050456', '1111', 'oMp1W41VcjNBIKSDDXw92zbf2cUc', 'd9cf3d17c4b773f75fd14c6ab47fce08xn', NULL, NULL),
(5, 'Z242019052717281558949315464', '111111', '+8617603021918', '广东省深圳市福田区福中三路', '广东省深圳市福田区福中三路', 0, '1558949315464', '0', 5, 1, 1, '1558949312742', '', 'oMp1W41VcjNBIKSDDXw92zbf2cUc', '33faa785cb2453dc11375bb2aa1ff6fcxn', NULL, NULL),
(6, 'Z24201905289121559005937197', '1', '+8617603021918', '广东省深圳市福田区福中三路市民中心A区', '广东省深圳市福田区福中三路市民中心A区', 0, '1559005937197', '0', 5, 1, 1, '1559005934858', '11', 'oMp1W41VcjNBIKSDDXw92zbf2cUc', '6ae22d8aff86c1e3d926e55697d25bcfxn', NULL, NULL),
(7, 'Z242019052815261559028409945', '懂', '+6118200872446', '深圳市中科纳能研发中心(深圳市南山区)', '布里斯班机场', 3925, '1559028409945', '0', 2, 1, 2, '1559028409631', '', 'undefined', 'ab4fd584072f2d07538182e99e954370xn', NULL, NULL),
(8, 'Z242019052815291559028563524', '1', '+8617603021918', '广东省深圳市福田区福中三路', '悉尼机场', 3275, '1559028563524', '0', 2, 1, 1, '1559028561199', '1111111', 'oMp1W41VcjNBIKSDDXw92zbf2cUc', 'a4272f77ea0b5c80a28a2da4e1212b96xn', NULL, NULL);

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
('undefined', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKtGyvJqJpmIC9mLHgibQUdoLxib7gQkjP6zulyG7kciaibg8lric2blOHFLBmlEzGqttT71yzFP0AQAAA/132', 'Luyusen', 1, ''),
('undefined', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEIItiamFh2bicA3XadTKuF62heejzfV4sx5tNibJtgefsyXOFacicLPmrzC3aDicfdH8sBhibjmFRHpzaXw/132', 'Luyusen', 1, ''),
('undefined', 'https://wx.qlogo.cn/mmopen/vi_32/xY2kmIGqa7W1A4a1g96uFf6VicNGSyRNaY545mFlVyibtib1rycibwx6jn5hicftap7FMnpZ67DEgBswNv44Mfjuia9g/132', '?烂好人', 1, 'Shenzhen'),
('undefined', 'https://wx.qlogo.cn/mmopen/vi_32/xY2kmIGqa7W1A4a1g96uFf6VicNGSyRNaY545mFlVyibtib1rycibwx6jn5hicftap7FMnpZ67DEgBswNv44Mfjuia9g/132', '?烂好人', 1, 'Shenzhen');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号', AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `serve`
--
ALTER TABLE `serve`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `the_order`
--
ALTER TABLE `the_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `vehicle_type`
--
ALTER TABLE `vehicle_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
