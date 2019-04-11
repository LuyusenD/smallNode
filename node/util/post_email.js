
const nodemailer = require('nodemailer')
const smtpTransport = require('nodemailer-smtp-transport')
const config = require('../config')
console.log(config)
// exports = module.exports = function () {
  const transport = nodemailer.createTransport(smtpTransport({
    host: config.EMAIL_HOST,
    port: config.EMAIL_PORT,
    secureConnection: true,
    auth: {
      user: EMAIL_USER,
      pass: EMAIL_SKY
    }
  }));

  const mailOptions = {
    from: '"均铨" <941332394@qq.com>',  //发送邮件的邮箱，与上面 user 相同
    to: 'd7242586@163.com',  //接收邮件的邮箱，如有多个，用逗号隔开
    subject: '这是一封测试邮件',  //邮件标题
    html: '<p> 鸡儿 接受邮箱吧</p>' //邮件内容，可以为html
  };

  transport.sendMail(mailOptions, function(error, info){
    if(error){
      console.log(error);
    }else{
      console.log('Message sent: ' + info.response);
    }
  });
// }