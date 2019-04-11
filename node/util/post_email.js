
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
      user: config.EMAIL_USER,
      pass: config.EMAIL_SKY
    }
  }));

  const mailOptions = {
    from: config.EMAIL_FROM,
    to: 'd7242586@163.com', //如有多个，用逗号隔开
    subject: config.EMAIL_TITLE, 
    html: `<p> 系统已为您更新 好朋友<GoodMate> 账户密码，请登陆后立即修改新密码 </p>
账号：214
密码：394939 ` //邮件内容，可以为html
  };

  transport.sendMail(mailOptions, function(error, info){
    if(error){
      console.log(error);
    }else{
      console.log('Message sent: ' + info.response);
    }
  });
// }