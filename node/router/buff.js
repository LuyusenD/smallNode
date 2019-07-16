/**
 * 
 * @authors Alones (7242586@qq.com)
 * @date    2019-03-17 01:17:02
 */
'use strict'

const express = require('express')
const router = express.Router()
const pool = require('../pool.js')
const tools = require('../util/generate.js')

let buffs = {}
// 获取服务类型 及 订单类型缓存
router.get('/test',(req,res) => {
  console.log(req.headers);
  res.writeHead(200,{
    'token': req.headers.token,
    'Access-Control-Expose-Headers': 'token',
  })
  // console.log(req.request);
  // res.setHeader('Access-Control-Allow-Origin','*')
  // res.setHeader('Access-Control-Allow-Headers','xToken')
  // res.setHeader('Access-Control-Expose-Headers','xToken')
  // res.setHeader('Access-Control-Allow-Method','POST,GET')
  res.write(JSON.stringify({code: 200, data: 'test', msg: 'test'}))
  res.end()
})

router.get('/',(req,res) => {
  console.log('Hello')
  let obj = {}
  new Promise((open) => {
    let sql = `SELECT * FROM serve`
    pool.query(sql,[],(err,result) => {
      if (err) throw err;
      obj.serve = result
      open()
    })
  }).then(() => {
    let sql = `SELECT * FROM state`
    pool.query(sql,[],(err,result) => {
      if (err) throw err;
      obj.state = result
      getvehicle()
    })
  })
  function getvehicle () {
    let sql = `SELECT * FROM vehicle_type`
    pool.query(sql,[],(err,result) => {
      if (err) throw err;
      obj.vehicle = result
      getmoney()
    })
  }
  function getmoney () {
    let sql = `SELECT * FROM money`
    pool.query(sql,[],(err,result) => {
      if (err) throw err;
      obj.money = result
      buffs = JSON.parse(JSON.stringify(obj))
      res.send({code: 200, data: obj, msg: '获取缓存成功'})
    })
  }
})
// 后台管理 - 添加服务类型
router.post('/addserve',(req,res) => {
  let v = req.body,
      sql = `INSERT INTO serve (name, icon, money) VALUES (?,?,?)`,
      parameter = tools.parameter(v,['str','url','money'])

  if (parameter) {
    res.send(parameter)
    return
  }

  pool.query(sql,[v.str,v.url,v.money],(err,result) => {
    if (err) throw err;
    result.affectedRows > 0?
      res.send({code: 200, data: null, msg: '添加服务成功'})
    :
      res.send({code: 401, data: null, msg: '添加服务出错'})
  })
})

// 后台管理 - 添加车类型
router.post('/addvehicle',(req,res) => {
  let v = req.body,
      sql = `INSERT INTO vehicle_type (name, money) VALUES (?,?)`,
      parameter = tools.parameter(v,['name','money'])

  if (parameter) {
    res.send(parameter)
    return
  }

  pool.query(sql,[v.name,Number(v.money)],(err,result) => {
    if (err) throw err;
    result.affectedRows > 0?
      res.send({code: 200, data: null, msg: '添加汽车类型成功'})
    :
      res.send({code: 401, data: null, msg: '添加汽车类型出错'})
  })
})

//后台管理 - 加个管理
router.get('/setmoney',(req,res) => {
  let v = req.query,
      parameter = tools.parameter(v,['type','id','money']),
      arr = ['serve','vehicle']

  if (parameter) {
    res.send(parameter)
    return
  }

  if (!arr.includes(v.type)) {
    return
  }
  v.type == 'vehicle' ? v.type = 'vehicle_type' : ''
  let sql = `UPDATE ${v.type} SET money = ? WHERE id = ?`
  
  pool.query(sql,[v.money,v.id],(err,result) => {
    if (err) throw err;
    if (result.affectedRows > 0)
      res.send({code: 200, data: null, msg: `更新${v.type}成功`})
    else
      res.send({code: 401, data: null, msg: '更新失败'})
  })
})

//后台管理-修改公里小时 价格
router.post('/updatemoney',(req,res) => {
  let v = req.body,
      sql = `UPDATE money SET money = ? WHERE name = ?`,
      parameter = tools.parameter(v,['name','money'])

  if (parameter) {
    res.send(parameter)
    return
  }

  pool.query(sql,[v.money,v.name],(err,result) => {
    if (err) throw err;
    result.affectedRows > 0?
      res.send({code: 200, data: null, msg: '修改成功'})
    :
      res.send({code: 401, data: null, msg: '修改出错'})
  })
})

//后台管理-删除服务 车类型
router.post('/delvehicle',(req,res) => {
  let v = req.body,
      sql = `DELETE FROM vehicle_type WHERE id = ?`,
      parameter = tools.parameter(v,['id'])

  if (parameter) {
    res.send(parameter)
    return
  }

  pool.query(sql,[v.id],(err,result) => {
    if (err) throw err;
    result.affectedRows > 0?
      res.send({code: 200, data: null, msg: '删除成功'})
    :
      res.send({code: 401, data: null, msg: '删除出错'})
  })
})

//后台管理-删除服务 车类型
router.post('/delserver',(req,res) => {
  let v = req.body,
      sql = `DELETE FROM serve WHERE id = ?`,
      parameter = tools.parameter(v,['id'])

  if (parameter) {
    res.send(parameter)
    return
  }

  pool.query(sql,[v.id],(err,result) => {
    if (err) throw err;
    result.affectedRows > 0?
      res.send({code: 200, data: null, msg: '删除成功'})
    :
      res.send({code: 401, data: null, msg: '删除出错'})
  })
})

router.get('/sercont',(req,res) => {
  let sql = `select id,title,type from server_cont`
  pool.query(sql,(err,result) => {
    if (err) throw err;
    result.length > 0 ?
      res.send({code: 200, data: result, msg: '查询服务内容成功', ps: '类型为1的时候 属于清洁内容， 2为 家具安装内容'})
    :
      res.send({code: 401, data: null, msg: '服务出错'})
  })
})

router.get('/sercont/add',(req,res) => {
  let v = req.query,
      parameter = tools.parameter(v,['title','type'])

  if (parameter) {
    res.send(parameter)
    return
  }
  let sql = `INSERT INTO server_cont (title, type) VALUES (?,?) `
  pool.query(sql,[v.title,v.type],(err,result) => {
    if (err) throw err;
    result.affectedRows > 0 ?
      res.send({code: 200, data: null, msg: '添加成功'})
    :
      res.send({code: 401, data: null, msg: '服务出错'})
  })
})

router.get('/sercont/del',(req,res) => {
  let v = req.query,
      parameter = tools.parameter(v,['id'])

  if (parameter) {
    res.send(parameter)
    return
  }
  let sql = `DELETE FROM server_cont WHERE id = ? `
  pool.query(sql,[v.id],(err,result) => {
    if (err) throw err;
    result.affectedRows > 0 ?
      res.send({code: 200, data: null, msg: '删除成功'})
    :
      res.send({code: 401, data: null, msg: '服务出错'})
  })
})

router.get('/sercont/update',(req,res) => {
  let v = req.query,
      parameter = tools.parameter(v,['id','title','type'])

  if (parameter) {
    res.send(parameter)
    return
  }
  let sql = `UPDATE server_cont SET title = ?,type = ? WHERE id = ?`
  pool.query(sql,[v.title,v.type,v.id],(err,result) => {
    if (err) throw err;
    result.affectedRows > 0 ?
      res.send({code: 200, data: null, msg: '更改成功'})
    :
      res.send({code: 401, data: null, msg: '服务出错'})
  })
})
module.exports = router
