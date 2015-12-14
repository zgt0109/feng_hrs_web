$(function(){
  // 切换验证码
  $('.yanzhengma .change').click(function(event){
    $('.rucaptcha-image').attr('src', '/rucaptcha');
    event.preventDefault();
  });

  // 获取验证码
  $('.btn-sms-signup').click(function(){
    data= {
      mobile: $('#enterprise_mobile').val(),
      _rucaptcha: $('._rucaptcha').val()
    }

    $.post('/signup/send_sms', data, function(data){

      if(data.success){
        $('.btn-sms-signup').html('验证码已发送');
      }else{
        console.log(data.msg);
        if(data.error == 'mobile_incorrect'){
          $('.login-error-message').html('手机号码错误');
        }

        if(data.msg == 'invalid captcha'){
          $('.login-error-message').html('验证码错误');
        }
      }

    })
    event.preventDefault();
  })



})
