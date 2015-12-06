sequence_min = 1
sequence_max = 5

puts "-"*50
puts "创建测试工友......"
# 我的工友
after "development:enterprise" do
  enterprise = Enterprise.find_by_email('song@91tbm.com')
  (sequence_min..sequence_max).each do |labor_seq|
    enterprise.labors.create(
    name: "测试工友_#{labor_seq}",
    mobile: "1355402836#{labor_seq}",
    idcard: "42092319900109181#{labor_seq}",
    gender: "male",
    birthday: "1982-11-25",
    province: "310000",
    city: "310100",
    district: "310115",
    channel: "web"
    )
    enterprise.save
  end
end
