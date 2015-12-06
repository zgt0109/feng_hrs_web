sequence_min = 1
sequence_max = 5

puts "-"*50
puts "创建测试充值数据......"
# 充值
after "development:enterprise" do
  enterprise = Enterprise.find_by_email('zhao@91tbm.com')
    (sequence_min..sequence_max).each do |cash_seq|
      enterprise.cash_ins.create(
        amount: cash_seq * 10000,
        serial_inner: 1000 + cash_seq,
        serial_outer: 2000 + cash_seq,
        channel: "Bank",
        note: "测试充值",
      )
    end
end
