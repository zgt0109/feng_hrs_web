class Sms
  def get_verify_code
    randoms = Set.new

    loop do
      randoms << rand(9)
      code = randoms.to_a.join
      return code if randoms.size >= 6 && Captcha.find_by(code: code).nil?
    end
  end


  def send(mobile)
    code = get_verify_code
    # 【淘帮忙】注册账号验证码:#code#，验证码有效时间为30分钟

    captcha = Captcha.find_or_initialize_by(mobile: mobile)


    return if captcha.send_at && captcha.send_at > 2.minutes.ago

    captcha.code = code
    captcha.send_at = Time.zone.now
    captcha.save!

    ChinaSMS.use :yunpian, password: ENV['SMS_YUNPIAN_KEY']
    # ChinaSMS.to phone, code
    tpl_params = { code: code }
    ChinaSMS.to mobile, tpl_params, tpl_id: 887075

  end
end
