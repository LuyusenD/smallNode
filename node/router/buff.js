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
  res.writeHead(200,{'Access-Control-Allow-Origin':'*'})
  res.write(JSON.stringify({code: 200, data: 'test', msg: 'test'}))
  res.end()
})

router.get('/',(req,res) => {
  let obj = {}
  new Promise((open) => {
    let sql = `SELECT * FROM serve`
    pool.query(sql,[],(err,result) => {
      obj.serve = result
      open()
    })
  }).then(() => {
    let sql = `SELECT * FROM state`
    pool.query(sql,[],(err,result) => {
      obj.state = result
      getvehicle()
    })
  })
  function getvehicle () {
    let sql = `SELECT * FROM vehicle_type`
    pool.query(sql,[],(err,result) => {
      obj.vehicle = result
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
    console.log(result)
    result.affectedRows > 0?
      res.send({code: 200, data: null, msg: '添加汽车类型成功'})
    :
      res.send({code: 401, data: null, msg: '添加汽车类型出错'})
  })
})

//后台管理 - 加个管理
router.post('/setmoney',(req,res) => {
  let v = req.body,
      parameter = tools.parameter(v,['buffs'])

  if (parameter) {
    res.send(parameter)
    return
  }

  
})

module.exports = router
