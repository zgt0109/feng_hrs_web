Rails.application.configure do
  # Action Mailer
  config.action_mailer.default_url_options = { host: ENV['EMAIL_PROVIDER_HOST'] }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.delivery_method = :smtp

  config.action_mailer.default charset: 'utf-8'
  config.action_mailer.default_options = {
    from:     '"淘帮忙团队" <no-reply@10000zhi.cn>',
    reply_to: '"淘帮忙问题反馈" <talk@91tbm.com>'
  }

  config.action_mailer.smtp_settings = {
    address:        'smtp.exmail.qq.com',
    port:           25,
    user_name:      ENV['EMAIL_PROVIDER_USERNAME'],
    password:       ENV['EMAIL_PROVIDER_PASSWORD'],
    authentication: :login,
    enable_starttls_auto: true
  }
end
