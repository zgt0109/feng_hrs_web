puts "-"*50
puts "创建测试帐号"
puts "用户名: zhao@91tbm.com  (招聘方)"
puts "用户名: song@91tbm.com  (送人方)"
puts "用户名: hr@91tbm.com    (企业HR)"
puts "密码: password"

[
  {name: '招聘方', mobile: '18621248234', email: 'zhao@91tbm.com'},
  {name: '送人方', mobile: '18621248235', email: 'song@91tbm.com'},
  {name: '企业HR', mobile: '18621248236', email: 'hr@91tbm.com'}
].each do |user|
  Enterprise.create( user.merge({password: 'password', confirmed_at: Time.now}) )
end
