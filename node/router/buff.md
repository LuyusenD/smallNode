#
#   @authors Alones (7242586@qq.com)
#   @date    2019-03-14 23:29:02
#

# host: localhost:3000/

# 缓存区 (返回所有服务类型 及 订单状态)
# api: /buff
# methods: get
# req:
# res: {
#   code:200, 
#   data: {
#      serve: [], //服务类型
#      state: [], //订单状态
#      vehicle: []//汽车类型
#   }}

# 添加服务
# api: buff/addserve
# methods: post
# req: { str: '',url: '' }
# res: {
#   code:200, 
#   data: null
#   msg: '添加成功'
#   }

# 添加汽车类型
# api: buff/addvehicle
# methods: post
# req: { name: '',money: 1(number) }
# res: {
#   code:200, 
#   data: null
#   msg: '添加成功'
#   }
