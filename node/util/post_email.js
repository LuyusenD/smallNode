
const nodemailer = require('nodemailer')
const smtpTransport = require('nodemailer-smtp-transport')
const config = require('../config')

exports = module.exports = function (to,user,pwd) {
  console.log(to,user,pwd)

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
    from: `${config.Name} ${config.EMAIL_FROM}`,
    to, //如有多个，用逗号隔开
    subject: config.Name + config.EMAIL_TITLE, 
    html: `<p> 系统已为您更新 ${config.Name} 账户密码，请登陆后立即修改新密码 </p> <p> 账号：${user}</p> <p> 密码：${pwd}</p>`
  };

  transport.sendMail(mailOptions, function(error, info){
    if(error){
      console.log(error);
    }else{
      console.log('Message sent: ' + info.response);
    }
  });
}