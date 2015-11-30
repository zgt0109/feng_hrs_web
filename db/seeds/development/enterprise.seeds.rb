puts "-"*50
puts "创建测试帐号"
puts "用户名: zhao@91tbm.com  (招聘方)"
puts "用户名: song@91tbm.com  (送人方)"
puts "用户名: hr@91tbm.com    (企业HR)"
puts "密码: password"

['zhao@91tbm.com', 'song@91tbm.com', 'hr@91tbm.com'].each do |email|
  Enterprise.create(
    email: email,
    password: 'password',
    confirmed_at: Time.now
  )
end
