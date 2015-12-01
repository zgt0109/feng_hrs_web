puts "-"*50
puts "创建行业数据......."

Industry.create(name: '财务/金融/保险', name_seo: 'jirong') do |industry|
  industry.children.build([
    {name: '财务/审计', name_seo: 'caiwu'},
    {name: '金融/银行', name_seo: 'yinhang'},
    {name: '保险', name_seo: 'baoxian'},
  ])
  industry.save
end


Industry.create(name: '重工/制造业', name_seo: 'jixie') do |industry|
  industry.children.build([
    {name: '钢铁/机械/设备/重工', name_seo: 'zhonggong'},
    {name: '出版/印刷/造纸', name_seo: 'chuban'},
    {name: '原材料加工', name_seo: 'jiagong'},
  ])
  industry.save
end


Industry.create(name: '服务业', name_seo: 'fuwu') do |industry|
  industry.children.build([
    {name: '旅游/酒店', name_seo: 'jiudian'},
    {name: '医疗/保健', name_seo: 'baojian'},
    {name: '美容', name_seo: 'meirong'},
  ])
  industry.save
end
