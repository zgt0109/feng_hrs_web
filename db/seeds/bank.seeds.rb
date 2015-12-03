puts "-"*50
puts "创建银行数据......."

%w(
	中国工商银行 中国建设银行 中国银行 中国农业银行 交通银行
	招商银行 中国邮政储蓄银行 中信银行 光大银行 民生银行
).each do |name|
	Bank.create(name: name, published_at: Time.now)
end
