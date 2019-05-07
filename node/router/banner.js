/**
 * 
 * @authors Alones (7242586@qq.com)
 * @date    2019-03-16 16:17:02
 */
'use strict'

const express = require('express')
const router = express.Router()
const pool = require('../pool.js')
const tools = require('../util/generate.js')

router.post('/add',(req,res) => {
  let v = req.body,
      parameter = tools.parameter(v,['url']),
      sql = `INSERT INTO banner (url) VALUES (?)`

  if (parameter) {
    res.send(parameter)
    return
  }

  pool.query(sql,[v.url],(err,result) => {
    if (err) throw err;
    if (result.affectedRows > 0)
      res.send({code: 200, data: null, msg: '新增banner成功'})
    else
      res.send({code: 401, data: null, msg: '新增失败'})
  })
})

router.post('/update',(req,res) => {
  let v = req.body,
      parameter = tools.parameter(v,['url','id']),
      sql = `UPDATE banner SET url = ? WHERE id = ?`

  if (parameter) {
    res.send(parameter)
    return
  }

  pool.query(sql,[v.url,v.id],(err,result) => {
    if (err) throw err;
    if (result.affectedRows > 0)
      res.send({code: 200, data: null, msg: '更新banner成功'})
    else
      res.send({code: 401, data: null, msg: '更新失败'})
  })
})

router.post('/del',(req,res) => {
  let v = req.body,
      parameter = tools.parameter(v,['id']),
      sql = `DELETE FROM banner WHERE id = ?`

  if (parameter) {
    res.send(parameter)
    return
  }

  pool.query(sql,[v.id],(err,result) => {
    if (err) throw err;
    if (result.affectedRows > 0)
      res.send({code: 200, data: null, msg: '删除banner成功'})
    else
      res.send({code: 401, data: null, msg: '删除失败'})
  })
})

module.exports = router
