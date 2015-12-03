puts "-"*50
puts "创建运营管理账号"
puts "用户名: admin@91tbm.com  (超级管理员)"
puts "密码: password"

['admin@91tbm.com'].each do |email|
  Admin.create(
    email: email,
    password: 'password',
    confirmed_at: Time.now
  )
end
