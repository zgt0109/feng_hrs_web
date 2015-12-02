puts "-"*50
puts "创建职位数据......."

puts "生活 | 服务业"
top = Position.create(name: '生活服务', name_seo: 'shenghuofuwu')
[
  Position.create(name: '餐饮', name_seo: 'zplvyoujiudian') do |position|
    position.children.build([
      {name: '服务员', name_seo: 'cantfwy'},
      {name: '厨师/厨师长', name_seo: 'canguan'},
      {name: '洗碗工', name_seo: 'xiwangong'},
    ])
    position.save
  end,
  Position.create(name: '美容/美发', name_seo: 'meirongjianshen') do |position|
    position.children.build([
      {name: '发型师', name_seo: 'faxingshi'},
      {name: '美发助理/学徒', name_seo: 'meifaxuetu'},
      {name: '洗头工', name_seo: 'xitougong'},
    ])
    position.save
  end,
  Position.create(name: '保健按摩', name_seo: 'zpanmo') do |position|
    position.children.build([
      {name: '按摩师', name_seo: 'zhenjiuzg'},
      {name: '足疗师', name_seo: 'baojiananmozuliao'},
      {name: '搓澡工', name_seo: 'zpcuozao'},
    ])
    position.save
  end
].each do |position|
  position.move_to_child_of(top)
end

puts "人力 | 行政 | 管理"
top = Position.create(name: '人力|行政|管理', name_seo: 'guanli')
[
  Position.create(name: '人事/行政/后勤', name_seo: 'renli') do |position|
    position.children.build([
      {name: '文员', name_seo: 'wenziluru'},
      {name: '前台/总机/接待', name_seo: 'qiantai'},
      {name: '人事专员/助理', name_seo: 'zhaopinjingli'},
    ])
    position.save
  end,
  Position.create(name: '司机', name_seo: 'siji') do |position|
    position.children.build([
      {name: '商务司机', name_seo: 'shangwujiaochesiji'},
      {name: '客运司机', name_seo: 'changtukeyuansiji'},
      {name: '货运司机', name_seo: 'sonhuosiji'},
    ])
    position.save
  end,
  Position.create(name: '高级管理', name_seo: 'zpguanli') do |position|
    position.children.build([
      {name: 'CEO/总裁/总经理', name_seo: 'zpzongcai'},
      {name: '首席运营官COO', name_seo: 'shouxiyunying'},
      {name: '首席财务官CFO', name_seo: 'shouxicaiwu'},
    ])
    position.save
  end
].each do |position|
  position.move_to_child_of(top)
end

puts "销售 | 客服 | 采购"
top = Position.create(name: '销售 | 客服 | 采购', name_seo: 'caigou')
[
  Position.create(name: '销售', name_seo: 'xiaoshou') do |position|
    position.children.build([
      {name: '销售助理', name_seo: 'xiaoshouzhuli'},
      {name: '电话销售', name_seo: 'dianxiao'},
      {name: '销售主管', name_seo: 'xiaoshouzhuguan'},
    ])
    position.save
  end,
  Position.create(name: '客服', name_seo: 'kefu') do |position|
    position.children.build([
      {name: '客服专员', name_seo: 'kefuzhuanyuan'},
      {name: '客服主管', name_seo: 'kefuzhuguan'},
      {name: '客服总监', name_seo: 'kefuzongjian'},
    ])
    position.save
  end,
  Position.create(name: '超市/百货/零售', name_seo: 'chaoshi') do |position|
    position.children.build([
      {name: '营业员', name_seo: 'yingyeyuan'},
      {name: '收银员', name_seo: 'shouyinyuan'},
      {name: '促销员', name_seo: 'cuxiaoyuan'},
    ])
    position.save
  end
].each do |position|
  position.move_to_child_of(top)
end

puts "市场 | 媒介 | 广告 | 设计"
top = Position.create(name: '市场 | 媒介 | 广告 | 设计', name_seo: 'sheji')
[
  Position.create(name: '市场/媒介/公关', name_seo: 'gongguan') do |position|
    position.children.build([
      {name: '市场专员', name_seo: 'shichangzhuanyuan'},
      {name: '市场经理', name_seo: 'shichangjingli'},
      {name: '公关经理', name_seo: 'gongguanjingli'},
    ])
    position.save
  end,
  Position.create(name: '广告/会展/咨询', name_seo: 'zixun') do |position|
    position.children.build([
      {name: '广告设计', name_seo: 'guanggaosheji'},
      {name: '广告创意', name_seo: 'guanggaochuangyi'},
      {name: '婚礼策划师', name_seo: 'hunlicehuashi'},
    ])
    position.save
  end,
  Position.create(name: '美术/设计/创意', name_seo: 'chuangyi') do |position|
    position.children.build([
      {name: '服装设计', name_seo: 'fuzhuangsheji'},
      {name: '平面设计', name_seo: 'pingmiansheji'},
      {name: '动画设计', name_seo: 'donghuasheji'},
    ])
    position.save
  end
].each do |position|
  position.move_to_child_of(top)
end

puts "生产 | 物流 | 质控 | 汽车"
top = Position.create(name: '生产 | 物流 | 质控 | 汽车', name_seo: 'shengchan')
[
  Position.create(name: '普工/技工', name_seo: 'jigong') do |position|
    position.children.build([
      {name: '普工', name_seo: 'pugong'},
      {name: '综合维修工', name_seo: 'zongheweixiugong'},
      {name: '制冷/水暖工', name_seo: 'zhilenggong'},
    ])
    position.save
  end,
  Position.create(name: '服装/纺织/食品', name_seo: 'yifushipin') do |position|
    position.children.build([
      {name: '服装设计师', name_seo: 'fuzhuangshejishi'},
      {name: '纺织品设计师', name_seo: 'fangzhishejishi'},
      {name: '服装打样/制版', name_seo: 'fuzhuangdayangshi'},
    ])
    position.save
  end,
  Position.create(name: '质控/安防', name_seo: 'zhikonganfang') do |position|
    position.children.build([
      {name: '质量管理/测试经理', name_seo: 'zhiliangguanli'},
      {name: '质量检验员/测试员', name_seo: 'zhijianyuan'},
      {name: '测试工程师', name_seo: 'gongchengshiceshi'},
    ])
    position.save
  end
].each do |position|
  position.move_to_child_of(top)
end

puts "网络 | 通信 | 电子"
top = Position.create(name: '网络 | 通信 | 电子', name_seo: 'dianzi')
[
  Position.create(name: '计算机/互联网/通信', name_seo: 'tongxin') do |position|
    position.children.build([
      {name: '程序员', name_seo: 'chengxuyuan'},
      {name: '项目经理', name_seo: 'xiangmujingli'},
      {name: '网站编辑', name_seo: 'wangzhanbianji'},
    ])
    position.save
  end,
  Position.create(name: '电子/电气', name_seo: 'dianqi') do |position|
    position.children.build([
      {name: '自动化工程师', name_seo: 'zidonghuashi'},
      {name: '电气工程师', name_seo: 'dianqigongchengshi'},
      {name: '视频工程师', name_seo: 'videoshi'},
    ])
    position.save
  end,
  Position.create(name: '机械/仪表', name_seo: 'yibiao') do |position|
    position.children.build([
      {name: '机电工程师', name_seo: 'jidiangongchengshi'},
      {name: '机械工程师', name_seo: 'jixiegongchengshi'},
      {name: '版图设计工程师', name_seo: 'bantushi'},
    ])
    position.save
  end
].each do |position|
  position.move_to_child_of(top)
end

puts "法律 | 教育 | 翻译 | 出版"
top = Position.create(name: '法律 | 教育 | 翻译 | 出版', name_seo: 'chuban')
[
  Position.create(name: '法律', name_seo: 'falv') do |position|
    position.children.build([
      {name: '律师', name_seo: 'lvshi'},
      {name: '法务专员', name_seo: 'fawuzhuanyuan'},
      {name: '法律顾问', name_seo: 'falvguwen'},
    ])
    position.save
  end,
  Position.create(name: '教育培训', name_seo: 'peixun') do |position|
    position.children.build([
      {name: '家教', name_seo: 'jiajiao'},
      {name: '讲师', name_seo: 'jiangshi'},
      {name: '幼教', name_seo: 'youjiao'},
    ])
    position.save
  end,
  Position.create(name: '编辑/出版/印刷', name_seo: 'bianji') do |position|
    position.children.build([
      {name: '主编', name_seo: 'zhubian'},
      {name: '记者', name_seo: 'jizhe'},
      {name: '出版/发行', name_seo: 'faxing'},
    ])
    position.save
  end
].each do |position|
  position.move_to_child_of(top)
end

puts "财会 | 金融 | 保险"
top = Position.create(name: '财会 | 金融 | 保险', name_seo: 'money')
[
  Position.create(name: '财务/审计/统计', name_seo: 'caiwu') do |position|
    position.children.build([
      {name: '会计', name_seo: 'kuaiji'},
      {name: '出纳', name_seo: 'chuna'},
      {name: '审计专员', name_seo: 'shenjizhuanyuan'},
    ])
    position.save
  end,
  Position.create(name: '金融/银行/证券/投资', name_seo: 'jinrong') do |position|
    position.children.build([
      {name: '银行经理', name_seo: 'yinhangjingli'},
      {name: '信贷管理', name_seo: 'xindaiguanli'},
      {name: '投资/顾问', name_seo: 'touzi'},
    ])
    position.save
  end,
  Position.create(name: '保险', name_seo: 'baoxian') do |position|
    position.children.build([
      {name: '保险客户经理', name_seo: 'kehujingli'},
      {name: '保险客服', name_seo: 'baoxiankefu'},
      {name: '保险顾问', name_seo: 'baoxianguwen'},
    ])
    position.save
  end
].each do |position|
  position.move_to_child_of(top)
end

puts "医疗 | 制药 | 环保"
top = Position.create(name: '医疗 | 制药 | 环保', name_seo: 'yiliao')
[
  Position.create(name: '医疗/护理', name_seo: 'huli') do |position|
    position.children.build([
      {name: '医生', name_seo: 'yisheng'},
      {name: '护士', name_seo: 'hushi'},
      {name: '宠物护理', name_seo: 'chongwuhuli'},
    ])
    position.save
  end,
  Position.create(name: '制药/生物工程', name_seo: 'zhiyao') do |position|
    position.children.build([
      {name: '医药研发/生产/注册', name_seo: 'yiliaoyanfa'},
      {name: '临床研究', name_seo: 'linchuangyanjiu'},
      {name: '生物工程/生物制药', name_seo: 'shengwuzhiyao'},
    ])
    position.save
  end,
  Position.create(name: '环保', name_seo: 'huanbao') do |position|
    position.children.build([
      {name: '污水处理师', name_seo: 'wushui'},
      {name: '环境管理/保护', name_seo: 'huanjingbaohu'},
      {name: '水质检测员', name_seo: 'shuizhijianceyuan'},
    ])
    position.save
  end
].each do |position|
  position.move_to_child_of(top)
end

puts "建筑 | 装修 | 物业 | 其他"
top = Position.create(name: '建筑 | 装修 | 物业 | 其他', name_seo: 'qita')
[
  Position.create(name: '建筑', name_seo: 'jianzhu') do |position|
    position.children.build([
      {name: '工程项目管理', name_seo: 'xiangmuguanli'},
      {name: '建筑工程师', name_seo: 'jianzhushi'},
      {name: '测绘/测量', name_seo: 'celiang'},
    ])
    position.save
  end,
  Position.create(name: '物业管理', name_seo: 'wuye') do |position|
    position.children.build([
      {name: '物业管理员', name_seo: 'wuyeguanliyuan'},
      {name: '物业经理', name_seo: 'wuyejingli'},
      {name: '物业维修', name_seo: 'wuyeweixiu'},
    ])
    position.save
  end,
  Position.create(name: '农/林/牧/渔业', name_seo: 'yuye') do |position|
    position.children.build([
      {name: '农艺师', name_seo: 'nongyishi'},
      {name: '畜牧师', name_seo: 'xumushi'},
      {name: '养殖人员', name_seo: 'yangzhirenyuan'},
    ])
    position.save
  end
].each do |position|
  position.move_to_child_of(top)
end
