/**
 * 
 * @authors Alones (7242586@qq.com)
 * @date    2019-03-14 14:29:02
 */

console.log(Date.now())

const bodyParse = require("body-parser")
const express=require('express')
// const https = require('https')
const fs = require('fs')
let app = express()

// const option = {
	// key: fs.readFileSync('/etc/nginx/cert/2123911.key'),
	// cert: fs.readFileSync('/etc/nginx/cert/2123911.pem')
// }
app.use(bodyParse.urlencoded({extended:false,limit: '50mb'}))

let order = require('./router/order.js');
let user = require('./router/user.js');
let buff = require('./router/buff.js');
let upload = require('./router/upload.js');
let banner = require('./router/banner.js');

app.listen(3000)

// https.createServer(option, app).listen(443)
app.use(express.static(__dirname + '/static'))
// 挂载
app.use('/order', order);
app.use('/user', user);
app.use('/upload', upload);
app.use('/buff', buff);
app.use('/banner', banner);
