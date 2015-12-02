puts "-"*50
puts "创建导航菜单......."

[
  {name: '我的工友库', uri: '/song/labors', icon: 'users'},
  {name: '工友登记', uri: '/song/labors/new', icon: 'user'},
  {name: '报名管理', uri: '#', icon: 'cloud upload'},
  {name: '招聘信息', uri: '#', icon: 'write square'},
  {name: '财务管理', uri: '#', icon: 'money'},
  {name: '我的评价', uri: '#', icon: 'comments'}

].each do |node|
  Menu.create(node.merge(domain: 'song'))
end

[
  {name: '联系人', uri: '/zhao/contacts', icon: 'diamond'},
  {name: '代招企业', uri: '/zhao/companies', icon: 'puzzle'},
  {name: '招聘职位', uri: '/zhao/jobs/new', icon: 'send'},
  {name: '工友管理', uri: '#', icon: 'users'},
  {name: '财务管理', uri: '#', icon: 'money'},
  {name: '我的评价', uri: '#', icon: 'comments'}
].each do |node|
  Menu.create(node.merge(domain: 'zhao'))
end


[
  {name: '发布招聘', uri: '#', icon: 'diamond'},
  {name: '众筹职位', uri: '#', icon: 'puzzle'},
  {name: '人资企业', uri: '#', icon: 'tag'},
  {name: '职位薪酬', uri: '#', icon: 'send'},
  {name: '财务管理', uri: '#', icon: 'money'},
  {name: '我的评价', uri: '#', icon: 'comments'}
].each do |node|
  Menu.create(node.merge(domain: 'hr'))
end

[
  {name: '企业用户', uri: '/admin/enterprise', icon: 'rocket'},
  {name: '工友管理', uri: '/admin/labors', icon: 'users'},
  {name: '联系人管理', uri: '/admin/contacts', icon: 'diamond'},
  {name: '代招企业', uri: '/admin/companies', icon: 'puzzle'},
  {name: '招聘管理', uri: '/admin/jobs', icon: 'send'},
].each do |node|
  Menu.create(node.merge(domain: 'admin'))
end
