sequence_min = 1
sequence_max = 5

puts "-"*50
puts "创建测试招聘信息......"
# 招聘职位
after "development:enterprise" do
  enterprise = Enterprise.find_by_email('zhao@91tbm.com')
  (sequence_min..sequence_max).each do |job_seq|
    puts enterprise.jobs.create!(
      name: "测试职位#{job_seq}",
      company: Company.take,
      contact: Contact.take,
      wage: 10000,
      unit: "permonth",
      worktime_list: '短白班,三班倒,做五休二',
      advantage_list: '五险一金,高额提成,可打酱油',
      royalty: 1000,
      bonus: 2000,
      channel: "cash",
      wageday: 15,
      wageday_unit: "month",
      advance: 10,
      job_quantity_attributes: { wish_unkown_count: 100 })
  end
end
