puts "-"*50
puts "创建运营管理账号"
puts "用户名: admin@91tbm.com  (超级管理员)"
puts "密码: password"


[
  {name: '超级管理员', mobile: '18621248234', email: 'admin@91tbm.com'}
].each do |user|
  Admin.create( user.merge({password: 'password', confirmed_at: Time.now}) )
end
