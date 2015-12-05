sequence_min = 1
sequence_max = 5

puts "-"*50
puts "创建测试招聘信息......"
# 招聘职位
after "development:enterprise" do
  enterprise = Enterprise.find_by_email('zhao@91tbm.com')
  (sequence_min..sequence_max).each do |job_seq|
    enterprise.jobs.create(
      name: "测试职位#{job_seq}",
      company_id: Company.take,
      contact_id: Contact.take,
      wage: 10000,
      unit: "permonth",
      worktime: 10,
      royalty: 1000,
      bonus: 2000,
      channel: "cash",
      wageday: 15,
      wageday_unit: "month",
      advance: 10
      )
  end
end
