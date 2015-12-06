sequence_min = 1
sequence_max = 5

puts "-"*50
puts "创建测试提现数据......"
# 提现
after "development:enterprise" do
  enterprise = Enterprise.find_by_email('zhao@91tbm.com')
    (sequence_min..sequence_max).each do |cash_seq|
      enterprise.cash_outs.create(
        amount: cash_seq * 10000,
        serial_inner: 1000 + cash_seq,
        serial_outer: 2000 + cash_seq,
        note: "测试充值"
      )
    end
end
