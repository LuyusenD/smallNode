# 日志

# 2019/03/18
#   新增api
#     1. order/userorder (返回该用户订单)
#
# 2019/03/19
#   新增api
#     1. order/getorder (根据手机号码 订单号 查询订单)
#     2. buff/addserve (添加服务)
#     3. 立即下单 备注更改为可传可不传 不限制
#     4. sql 新增admin表 存管理后台用户
#     5. nodeModules 新增模块 os fs 需要npm i
#     6. user/login 正在开发
#
# 2019/03/25
#   新增api
#     1. user/login (后台管理登录)
#     2. user/out (后台管理退出)
#   优化api
#     1. order/addevaluate (详细看订单的md文件)
#     2. 返回所有用户未评论的订单 (在获取用户订单 返回了字段 evaluate ,前端根据字段过滤出未评论的订单)
#
# 2019/04/03
#   新增api
#     1. upload 上传图片
#     2. sql 新增服务类型的字段
#     3. 更新添加服务类型的icon字段
#   优化api
#     
# 2019/04/09
#   新增api
#     1. addvehicle 添加车型
#     2. 新增 查询用户订单 (完成订单且未评论)
#   优化api
#     1. buff、  缓存新增车型返回
#     2. 立即下单新增 车型参数  用户不选择默认传0
#     3. sql 新增车型表 更新order订单字段
#
# 2019/04/10
#   新增
#     1. sql order新增评分字段
#   优化api
#     1. 评价接口新增字段 score评分
#
# 2019/04/11
#   新增(更新)
#     1. user/changepassword   更新为修改密码接口
#     2. user/forget   更新为忘记密码接口
#	  3. sql  admin表 新增 email字段
#   优化api
#     1. 新增 admin 用户  新增字段 email
#
# 2019/04/16
#   新增(更新)
#     1. addserve  更新接口
#	  2. sql  serve表 新增 money字段
#   优化api
#
# 2019/05/07
#   新增(更新)
#     1. banner/add or del or update or getbanner 新增banner操作
#          参数：
#             add接口:
#                 url(图片路径)
#             del接口:
#                 id(banner ID)
#             update接口:
#                 url(图片路径)
#                 id(banner ID)
#	    2. buff/setmoney  新增设置金额
#          参数:
#              type: server(服务 / 车类型)
#              id:   1 (该服务的id)
#              money： 66(金额)
#   优化api
#
# 2019/05/17
#   新增(更新)
#     1. banner/add or del or update or getbanner 新增banner操作
#          参数：
#             add接口:
#                 url(图片路径)
#             del接口:
#                 id(banner ID)
#             update接口:
#                 url(图片路径)
#                 id(banner ID)
#	    2. buff/setmoney  新增设置金额
#          参数:
#              type: server(服务 / 车类型)
#              id:   1 (该服务的id)
#              money： 66(金额)
#   优化api
#     1. sql更新
#     2. addorder 下单接口
#           oAddress 字段 更新为  startAddress [起始地址]
#           endAddress [终始地点]
#           kilometre [公里] 计算出公里数
