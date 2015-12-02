sequence_min = 1
sequence_max = 5

puts "-"*50
puts "创建测试联系人......"
# 联系人
after "development:enterprise" do
  enterprise = Enterprise.find_by_email('zhao@91tbm.com')
  (sequence_min..sequence_max).each do |contact_seq|
    enterprise.contacts.create(
      name: "联系人#{contact_seq}号",
      mobile: "1309261890#{contact_seq}",
      gender: "male"
    )
    enterprise.save
  end
end
