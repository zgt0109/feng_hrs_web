sequence_min = 1
sequence_max = 5

puts "-"*50
puts "创建测试公司......"
# 公司
after "development:enterprise" do
  enterprise = Enterprise.find_by_email('zhao@91tbm.com')
  (sequence_min..sequence_max).each do |company_seq|
    enterprise.companies.create(
      name: "淘帮忙_#{company_seq}",
      province: "310000",
      city: "310100",
      district: "310115",
      address: "上海外高桥保税区富特北路18号联安大厦5楼",
      introduction: "淘帮忙项目起源地, 希望我们能离梦想更进一步"
    )
    enterprise.save
  end
end
