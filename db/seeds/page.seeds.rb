puts "-"*50
puts "创建内容链接"

[
  ['淘帮忙简介', 'jianjie'],
  ['业务咨询', 'zixun'],
  ['法律声明', 'shengming'],
  ['服务协议', 'xieyi'],

  ['商务合作', 'hezuo'],
  ['网站联盟', 'lianmeng'],
  ['友情链接', 'lianjie'],
  ['业务资质', 'zizhi'],

  ['投诉建议', 'toushu']
].each do |page|
  Page.create(name: page[0], slug: page[1])
end
