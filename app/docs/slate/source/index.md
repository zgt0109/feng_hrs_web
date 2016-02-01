---
title: 淘帮忙API

language_tabs:
  - Shell

toc_footers:
  - <a href='http://www.91tbm.com'>淘帮忙网站</a>

search: true
---

# 淘帮忙API文档

文档介绍的主要是淘帮忙API参数请求介绍

<aside class="success">
Welcome to API!
</aside>


# 登录-Login

> 登录数据:

```json
{
  "enterprise[account]":"zhao@91tbm.com",
  "enterprise[password]":"password"
}
```

> Token数据:

```json
{
  "id":1,
  "email":"zhao@91tbm.com",
  "created_at":"2015-12-21T06:42:11.899Z",
  "updated_at":"2016-01-29T09:40:41.178Z",
  "name":"招聘方",
  "mobile":"18621248234",
  "balance":null,
  "role":null,
  "authentication_token":"MzuiQLmNu2LCMDL7gaEa"
}
```

### HTTP 请求

`POST http://localhost:3000/enterprises/sign_in.json`

### URL 参数

参数 | 说明 | 必填
--------- | ----------- | -----------
enterprise[account] | 用户名 | 是
enterprise[password] | 密码 | 是

### Login之后，后台返回用户信息，客户端将信息中的authentication_token保存在本地，随后的request的header中附带如下数据即可通过验证：
`Authorization: Token token=authentication_token`


# 工友-Labor

## 查看-index、show

> 响应的分页JSON数据:

```json
  {
    "current_page":1,
    "next_page":null,
    "prev_page":null,
    "total_pages":1,
    "total_count":5
  }
```

> 取出响应的工友集合JSON数据中的一条:

```json
[{
  "id":5,
  "enterprise_id":2,
  "name":"邹国涛123",
  "mobile":"13554028363",
  "idcard":"420923199001091231",
  "gender":"male",
  "birthday":"1991-09-16",
  "channel":"web",
  "province":"520000",
  "city":"520300",
  "district":"520321",
  "state":"registed",
  "deleted_at":null,
  "created_at":"2016-01-27T07:33:29.683Z",
  "updated_at":"2016-01-27T07:33:29.683Z",
  "province":"520000",
  "city":"520300",
  "district":"520321",
  "salary": "level5",
  "name": "Ruby工程师"
}]
```

### index页面的HTTP 请求

`GET http://localhost:3000/song/labors.json`

### URL 参数

参数 | 说明
--------- | -----------
current_page | 当前页面
next_page | 下一页
prev_page | 上一页
total_pages | 总页数
total_count | 总条数


> 根据ID响应的工友JSON数据:

```json
{
  "id":6,
  "enterprise_id":2,
  "name":"邹国涛",
  "mobile":"13554028363",
  "idcard":"420923199001091817",
  "gender":"male",
  "birthday":"1990-01-09",
  "channel":"web",
  "province":"520000",
  "city":"520300",
  "district":"520321",
  "state":"registed",
  "deleted_at":null,
  "created_at":"2016-01-27T07:33:29.683Z",
  "updated_at":"2016-01-27T07:33:29.683Z",
  "province":"520000",
  "city":"520300",
  "district":"520321",
  "salary": "level5",
  "name": "Ruby工程师"
}
```
### show页面的HTTP 请求

`GET http://localhost:3000/song/labors/<ID>.json`

### URL 参数

参数 | 说明
--------- | -----------
ID | 工友ID
enterprise_id | 企业用户ID
name | 工友名称
mobile | 工友电话
idcard | 身份证号码
gender | 工友性别，男：male，女：female
birthday | 生日
channel | 工友来源，网上登记：web
province | 现居住省，6个数字是中国城市代码表，下同
city | 现居住市
district | 现居住县
state | 工友状态，registed: 已登记，appointed: 已报名，passed: 面试通过，rejected: 面试失败，checkin: 已入职，refused: 未入职，turnover: 已离职
deleted_at | 删除时间
created_at | 创建时间
updated_at | 更新时间
province | 期望居住省
city | 期望居住市
district | 期望居住县
salary | 期望薪资
name | 期望职位

## 新增-create
> 响应数据:

```ruby
@labor
```

### HTTP 请求

`POST http://localhost:3000/song/labors.json`

### URL 参数

参数 | 说明 | 必填
--------- | ----------- | -----------
name | 工友名称 | 是
mobile | 工友电话 | 是
idcard | 身份证号码 | 是
province | 现居住省 | 是
city | 现居住市 | 是
district | 现居住县 | 是

### 期望 URL 参数

参数 | 说明 | 必填
--------- | ----------- | -----------
province | 期望居住省 | 是
city | 期望居住市 | 是
district | 期望居住县 | 是
salary | 期望薪资 | 是
name | 期望职位 | 是



## 修改-update
> 响应数据:

```ruby
@labor
```

### HTTP 请求

`PUT http://localhost:3000/song/labors/<ID>.json`

`PATCH http://localhost:3000/song/labors/<ID>.json`

### URL 参数

参数 | 说明
--------- | -----------
ID | 根据ID修改工友


## 删除-destroy

> 响应数据:

```ruby
@labor
```

### HTTP 请求

`DELETE http://localhost:3000/song/labors/<ID>.json`

### URL 参数

参数 | 说明
--------- | -----------
ID | 根据ID删除工友



# 联系人-Contact
## 查看-index、show

> 响应的分页JSON数据:

```json
  {
    "current_page":1,
    "next_page":null,
    "prev_page":null,
    "total_pages":1,
    "total_count":5
  }
```

> 取出响应的联系人集合JSON数据中的一条:

```json
[{
  "id":5,
  "enterprise_id":1,
  "name":"联系人5号",
  "mobile":"13092618905",
  "gender":"male",
  "deleted_at":null,
  "created_at":"2016-01-25T09:06:27.638Z",
  "updated_at":"2016-01-25T09:06:27.638Z"
}]
```

### index页面的HTTP 请求

`GET http://localhost:3000/zhao/contacts.json`

### URL 参数

参数 | 说明
--------- | -----------
current_page | 当前页面
next_page | 下一页
prev_page | 上一页
total_pages | 总页数
total_count | 总条数


> 根据ID响应的联系人JSON数据:

```json
{
  "id":5,
  "enterprise_id":1,
  "name":"联系人5号",
  "mobile":"13092618905",
  "gender":"male",
  "deleted_at":null,
  "created_at":"2016-01-25T09:06:27.638Z",
  "updated_at":"2016-01-25T09:06:27.638Z"
}
```
### show页面的HTTP 请求

`GET http://localhost:3000/zhao/contacts/<ID>.json`

### URL 参数

参数 | 说明
--------- | -----------
ID | 联系人ID
enterprise_id | 企业用户ID
name | 联系人名称
mobile | 联系人电话
gender | 工友性别，男：male，女：female


## 新增-create
> 响应数据:

```ruby
@contact
```
### HTTP 请求

`POST http://localhost:3000/zhao/contacts.json`

### URL 参数

参数 | 说明 | 必填
--------- | ----------- | -----------
name | 联系人名称 | 是
mobile | 联系人电话 | 是
gender | 联系人性别， 男：male，女：female | 是


## 修改-update
> 响应数据:

```ruby
@contact
```

### HTTP 请求

`PUT http://localhost:3000/zhao/contacts/<ID>.json`

`PATCH http://localhost:3000/zhao/contacts/<ID>.json`

### URL 参数

参数 | 说明
--------- | -----------
ID | 根据ID修改联系人


## 删除-destroy

> 响应数据:

```ruby
@contact
```

### HTTP 请求

`DELETE http://localhost:3000/zhao/contacts/<ID>.json`

### URL 参数

参数 | 说明
--------- | -----------
ID | 根据ID删除联系人



# 代招企业-Company

## 查看-index、show

> 响应的分页JSON数据:

```json
  {
    "current_page":1,
    "next_page":null,
    "prev_page":null,
    "total_pages":1,
    "total_count":5
  }
```

> 取出响应的代招企业集合JSON数据中的一条:

```json
[{
  "id":5,
  "enterprise_id":1,
  "name":"淘帮忙_5",
  "province":"310000",
  "city":"310100",
  "district":"310115",
  "address":"上海外高桥保税区富特北路18号联安大厦5楼",
  "introduction":"淘帮忙项目起源地,希望我们能离梦想更进一步",
  "deleted_at":null,
  "created_at":"2016-01-25T09:06:27.529Z",
  "updated_at":"2016-01-25T09:06:27.529Z"
}]
```

### index页面的HTTP 请求

`GET http://localhost:3000/zhao/companies.json`

### URL 参数

参数 | 说明
--------- | -----------
current_page | 当前页面
next_page | 下一页
prev_page | 上一页
total_pages | 总页数
total_count | 总条数


> 根据ID响应的工友JSON数据:

```json
{
  "id":5,
  "enterprise_id":1,
  "name":"淘帮忙_5",
  "province":"310000",
  "city":"310100",
  "district":"310115",
  "address":"上海外高桥保税区富特北路18号联安大厦5楼",
  "introduction":"淘帮忙项目起源地,希望我们能离梦想更进一步",
  "deleted_at":null,
  "created_at":"2016-01-25T09:06:27.529Z",
  "updated_at":"2016-01-25T09:06:27.529Z"
}
```
### show页面的HTTP 请求

`GET http://localhost:3000/zhao/companies/<ID>.json`

### URL 参数

参数 | 说明
--------- | -----------
ID | 代招企业ID
enterprise_id | 企业用户ID
name | 代招企业名称
province | 省
city | 市 |
district | 县
address | 代招企业公司地址
introduction | 代招企业简介


## 新增-create
> 响应数据:

```ruby
@company
```

### HTTP 请求

`POST http://localhost:3000/zhao/companies.json`

### URL 参数

参数 | 说明 | 必填
--------- | ----------- | -----------
name | 代招企业名称 | 是
province | 省 | 是
city | 市 | 是
district | 县 | 是
address | 代招企业地址 | 是
introduction | 代招企业公司简介 | 是


## 修改-update
> 响应数据:

```ruby
@company
```

### HTTP 请求

`PUT http://localhost:3000/zhao/companies/<ID>.json`

`PATCH http://localhost:3000/zhao/companies/<ID>.json`

### URL 参数

参数 | 说明
--------- | -----------
ID | 根据ID修改代招企业


## 删除-destroy

> 响应数据:

```ruby
@company
```

### HTTP 请求

`DELETE http://localhost:3000/zhao/companies/<ID>.json`

### URL 参数

参数 | 说明
--------- | -----------
ID | 根据ID删除代招企业


# 招聘信息-Job

## 查看-index、show

> 响应的分页JSON数据:

```json
  {
    "current_page":1,
    "next_page":null,
    "prev_page":null,
    "total_pages":1,
    "total_count":5
  }
```

> 取出响应的招聘信息集合JSON数据中的一条:

```json
  [{
  "id":7,
  "enterprise_id":2,
  "company_id":6,
  "contact_id":6,
  "name":"岗位标题456",
  "wage":12000,
  "unit":"permonth",
  "worktime":[{"id":1,"name":"短白班","taggings_count":6}],
  "royalty":"10%",
  "bonus":"3000",
  "channel":"cash",
  "wageday":15,
  "wageday_unit":"month",
  "advance":null,
  "deleted_at":null,
  "created_at":"2015-12-21T07:31:08.078Z",
  "updated_at":"2015-12-21T07:31:08.078Z",
  "details":"no",
  "advantages":[{"id":4,"name":"五险一金","taggings_count":6},
                {"id":6,"name":"可打酱油","taggings_count":7}]
  }]
```
### index页面的HTTP 请求

`GET http://localhost:3000/zhao/jobs.json`

### URL 参数

参数 | 说明
--------- | -----------
current_page | 当前页面
next_page | 下一页
prev_page | 上一页
total_pages | 总页数
total_count | 总条数



> 根据ID响应的招聘职位JSON数据:

```json
{
  "id":6,
  "enterprise_id":1,
  "company_id":5,
  "contact_id":5,
  "name":"测试职位5",
  "wage":10000,
  "unit":"permonth",
  "worktime":{"id":3,"name":"做五休二","taggings_count":5},
  "royalty":"1000",
  "bonus":"2000",
  "channel":"cash",
  "wageday":15,
  "wageday_unit":"month",
  "advance":10,
  "deleted_at":null,
  "created_at":"2016-01-25T09:06:28.313Z",
  "updated_at":"2016-01-25T09:06:28.313Z",
  "details":"精通Ruby编程\r\n对前端技术了解颇深",
  "wish_male_count":"3",
  "advantages":[
    {"id":4,"name":"五险一金","taggings_count":6},
    {"id":5,"name":"高额提成","taggings_count":6}]
}
```

> 招聘职位返费信息的JSON数据:

```json
{
  "id":1,
  "job_id":6,
  "gender":"male",
  "amount":1500,
  "unit":"permonth",
  "deadline": 2,
  "check": 15,
  "remit": 3,
  "name":"测试职位5",
  "wage":10000,
  "created_at":"2016-01-25T09:10:28.313Z",
  "updated_at":"2016-01-25T09:16:30.313Z"
}
```

### show页面的HTTP 请求

`GET http://localhost:3000/zhao/jobs/<ID>.json`

### URL 参数

参数 | 说明
--------- | -----------
ID | 招聘职位信息ID
enterprise_id | 企业用户ID
company_id | 公司ID
contact_id | 联系人ID
name | 招聘职位名称
wage | 招聘职位薪资
unit | 薪资发放方式, permonth: '元/月'，perhour: '元/时'
worktime | 工作时长, "做五休二", "三班倒" , "短白班"
royalty | 提成
bonus | 奖金
channel | 工资的发放方式, cash: '现金', card: '银行卡'
wageday | 工资发放日
wageday_unit | 工资发放形式, month: '按月', day: '按天'
advance | 预支工资
deleted_at | 招聘职位删除时间
created_at | 招聘职位创建时间
updated_at | 招聘职位更新时间
details | 招聘职位岗位要求
advantages | 职位亮点, "加班费", "年终奖", "五险一金"等

## 新增-create

> 响应数据:

```ruby
@job
```

### HTTP 请求

`POST http://localhost:3000/zhao/jobs.json`

### URL 参数

参数 | 说明 | 必填
--------- | ----------- | -----------
name | 招聘职位名称 | 是
company_id | 企业名称 | 是
contact_id | 联系人名称 | 是
wage | 员工薪资 | 是
unit | 工资的计费方式，如：permonth: '元/月'，perhour: '元/时' | 是
worktime | 工作时长 | 是
royalty | 提成 | 是
bonus | 奖金 | 是
advantages | 职位亮点 | 是
wish_male_count | 男员工人数 | 是
wish_female_count | 女员工人数 | 是
wish_unkown_count | 不论男女，共招多少人 | 否
details | 岗位具体要求 | 是
channel | 工资的发放方式, cash: '现金', card: '银行卡' | 是
wageday | 工资发放日 | 是
wageday_unit | 工资如何发放, month: '按月', day: '按天' | 是
advance | 预支工资，比如：每月15号发工资，10号临时有事，需要预支工资 | 否

#### 按月返利-Month
参数 | 说明 | 必填
--------- | ----------- | -----------
gender | 员工性别， 男：male，女：female | 是
amount | 金额，按月返 | 是
deadline | 共返利几个月 | 是
check | 每个月几号对名单 | 是
remit | 几天之内到账 | 是

#### 按小时返利—Hour
参数 | 说明 | 必填
--------- | ----------- | -----------
gender | 员工性别， 男：male，女：female | 是
amount | 金额，按时返 | 是
deadline | 共返利几个月 | 是
check | 每个月几号对名单 | 是
remit | 几天之内到账 | 是

#### 按天返利—Day
参数 | 说明 | 必填
--------- | ----------- | -----------
gender | 员工性别， 男：male，女：female | 是
deadline | 入职多少天 | 是
amount | 返多少钱 | 是


## 修改-update
> 响应数据:

```ruby
@job
```

### HTTP 请求

`PUT http://localhost:3000/zhao/jobs/<ID>.json`

`PATCH http://localhost:3000/zhao/jobs/<ID>.json`

### URL 参数

参数 | 说明
--------- | -----------
ID | 根据ID修改招聘职位


## 删除-destroy

> 响应数据:

```ruby
@job
```

### HTTP 请求

`DELETE http://localhost:3000/zhao/jobs/<ID>.json`

### URL 参数

参数 | 说明
--------- | -----------
ID | 根据ID删除招聘职位



# 绑定银行借记卡-Debit

## 新增-create
> 响应数据:

```ruby
@debit
```

### HTTP 请求

`POST http://localhost:3000/song/debit.json`

### URL 参数

参数 | 说明 | 必填
--------- | ----------- | -----------
bank_id | 银行名称 | 是
name | 用户名 | 是
account | 银行账户 | 是
deposit | 开户行 | 是
