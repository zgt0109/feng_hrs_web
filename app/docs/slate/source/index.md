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

## 新增-new、create

> 登录数据:

```json
{
  "account":"zhao@91tbm.com",
  "password":"password"
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

### 跳转到Login页面的HTTP 请求

`GET http://localhost:3000/enterprises/sign_in`

### URL 参数

参数 | 说明 | 必填
--------- | ----------- | -----------
enterprise[account] | 用户名 | 是
enterprise[password] | 密码 | 是

### 点击登录按钮 HTTP 请求

`POST http://localhost:3000/enterprises/sign_in`


# 工友-Labor

## 查看-index、show

> 响应数据:

```ruby
@labors
```
### 跳转到index页面的HTTP 请求

`GET http://localhost:3000/song/labors`

### URL 参数

参数 | 说明
--------- | -----------
labors | 所有的工友



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
  "name": "厨师/厨师长"
}
```
### 跳转到show页面的HTTP 请求

`GET http://localhost:3000/song/labors/<ID>`

### URL 参数

参数 | 说明
--------- | -----------
ID | 根据ID查看工友

## 新增-new、create
> 响应数据:

```ruby
@labor
```

### 跳转到new页面的HTTP 请求

`GET http://localhost:3000/song/labors/new`

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

### create时的HTTP 请求

`POST http://localhost:3000/song/labors`

## 修改-edit、update
> 响应数据:

```ruby
@labor
```

### 跳转到edit页面的HTTP 请求

`GET http://localhost:3000/song/labors/<ID>/edit`

### URL 参数

参数 | 说明
--------- | -----------
ID | 根据ID修改工友

### update时的HTTP 请求

`PUT http://localhost:3000/song/labors/<ID>`

`PATCH http://localhost:3000/song/labors/<ID>`

## 删除-destroy

> 响应数据:

```ruby
@labor
```

### HTTP 请求

`DELETE http://localhost:3000/song/labors/<ID>`

### URL 参数

参数 | 说明
--------- | -----------
ID | 根据ID删除工友



# 联系人-Contact

## 查看-index、show

> 响应数据:

```ruby
@contacts
```
### 跳转到index页面的HTTP 请求

`GET http://localhost:3000/zhao/contacts`

### URL 参数

参数 | 说明
--------- | -----------
contacts | 所有的联系人



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
### 跳转到show页面的HTTP 请求

`GET http://localhost:3000/zhao/contacts/<ID>`

### URL 参数

参数 | 说明
--------- | -----------
ID | 根据ID查看联系人

## 新增-new、create
> 响应数据:

```ruby
@contact
```
### 跳转到new页面的HTTP 请求

`GET http://localhost:3000/zhao/contacts/new`

### URL 参数

参数 | 说明 | 必填
--------- | ----------- | -----------
name | 联系人名称 | 是
mobile | 联系人电话 | 是
gender | 联系人性别 | 是

### create时的HTTP 请求

`POST http://localhost:3000/zhao/contacts`

## 修改-edit、update
> 响应数据:

```ruby
@contact
```

### 跳转到edit页面的HTTP 请求

`GET http://localhost:3000/zhao/contacts/<ID>/edit`

### URL 参数

参数 | 说明
--------- | -----------
ID | 根据ID修改联系人

### update时的HTTP 请求

`PUT http://localhost:3000/zhao/contacts/<ID>`

`PATCH http://localhost:3000/zhao/contacts/<ID>`

## 删除-destroy

> 响应数据:

```ruby
@contact
```

### HTTP 请求

`DELETE http://localhost:3000/zhao/contacts/<ID>`

### URL 参数

参数 | 说明
--------- | -----------
ID | 根据ID删除联系人



# 代招企业-Company

## 查看-index、show

> 响应数据:

```ruby
@companies
```
### 跳转到index页面的HTTP 请求

`GET http://localhost:3000/zhao/companies`

### URL 参数

参数 | 说明
--------- | -----------
companies | 所有的代招企业



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
### 跳转到show页面的HTTP 请求

`GET http://localhost:3000/zhao/companies/<ID>`

### URL 参数

参数 | 说明
--------- | -----------
ID | 根据ID查看代招企业

## 新增-new、create
> 响应数据:

```ruby
@company
```

### 跳转到new页面的HTTP 请求

`GET http://localhost:3000/zhao/companies/new`

### URL 参数

参数 | 说明 | 必填
--------- | ----------- | -----------
name | 代招企业名称 | 是
province | 省 | 是
city | 市 | 是
district | 县 | 是
address | 代招企业地址 | 是
introduction | 代招企业公司简介 | 是

### create时的HTTP 请求

`POST http://localhost:3000/zhao/companies`

## 修改-edit、update
> 响应数据:

```ruby
@company
```

### 跳转到edit页面的HTTP 请求

`GET http://localhost:3000/zhao/companies/<ID>/edit`

### URL 参数

参数 | 说明
--------- | -----------
ID | 根据ID修改代招企业

### update时的HTTP 请求

`PUT http://localhost:3000/zhao/companies/<ID>`

`PATCH http://localhost:3000/zhao/companies/<ID>`

## 删除-destroy

> 响应数据:

```ruby
@company
```

### HTTP 请求

`DELETE http://localhost:3000/zhao/companies/<ID>`

### URL 参数

参数 | 说明
--------- | -----------
ID | 根据ID删除代招企业


# 招聘信息-Job

## 查看-index、show

> 响应数据:

```ruby
@jobs
```
### 跳转到index页面的HTTP 请求

`GET http://localhost:3000/zhao/jobs`

### URL 参数

参数 | 说明
--------- | -----------
jobs | 所有的招聘职位



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

### 跳转到show页面的HTTP 请求

`GET http://localhost:3000/zhao/jobs/<ID>`

### URL 参数

参数 | 说明
--------- | -----------
ID | 根据ID查看招聘职位信息

## 新增-new、create

> 响应数据:

```ruby
@job
```

### 跳转到new页面的HTTP 请求

`GET http://localhost:3000/zhao/jobs/new`

### URL 参数

参数 | 说明 | 必填
--------- | ----------- | -----------
name | 招聘职位名称 | 是
company_id | 企业名称 | 是
contact_id | 联系人名称 | 是
wage | 员工薪资 | 是
unit | 工资的计费方式，如：元/月，元/时 | 是
worktime | 工作时长 | 是
royalty | 提成 | 是
bonus | 奖金 | 是
advantages | 职位亮点 | 是
wish_male_count | 男员工人数 | 是
wish_female_count | 女员工人数 | 是
wish_unkown_count | 不论男女，共招多少人 | 否
details | 岗位具体要求 | 是
channel | 工资的发放方式，如：银行卡，现金 | 是
wageday | 工资发放日 | 是
wageday_unit | 工资如何发放，如：按月，按天 | 是
advance | 预支工资，比如：每月15号发工资，10号临时有事，需要预支工资 | 否

#### 按月返利-Month
参数 | 说明 | 必填
--------- | ----------- | -----------
gender | 员工性别 | 是
amount | 金额，按月返 | 是
deadline | 共返利几个月 | 是
check | 每个月几号对名单 | 是
remit | 几天之内到账 | 是

#### 按小时返利—Hour
参数 | 说明 | 必填
--------- | ----------- | -----------
gender | 员工性别 | 是
amount | 金额，按时返 | 是
deadline | 共返利几个月 | 是
check | 每个月几号对名单 | 是
remit | 几天之内到账 | 是

#### 按天返利—Day
参数 | 说明 | 必填
--------- | ----------- | -----------
gender | 员工性别 | 是
deadline | 入职多少天 | 是
amount | 返多少钱 | 是

### create时的HTTP 请求

`POST http://localhost:3000/zhao/jobs`

## 修改-edit、update
> 响应数据:

```ruby
@job
```

### 跳转到edit页面的HTTP 请求

`GET http://localhost:3000/zhao/jobs/<ID>/edit`

### URL 参数

参数 | 说明
--------- | -----------
ID | 根据ID修改招聘职位

### update时的HTTP 请求

`PUT http://localhost:3000/zhao/jobs/<ID>`

`PATCH http://localhost:3000/zhao/jobs/<ID>`

## 删除-destroy

> 响应数据:

```ruby
@job
```

### HTTP 请求

`DELETE http://localhost:3000/zhao/jobs/<ID>`

### URL 参数

参数 | 说明
--------- | -----------
ID | 根据ID删除招聘职位



# 绑定银行借记卡-Debit

## 新增-new、create
> 响应数据:

```ruby
@debit
```

### 跳转到new页面的HTTP 请求

`GET http://localhost:3000/song/debit/new`

### URL 参数

参数 | 说明 | 必填
--------- | ----------- | -----------
bank_id | 银行名称 | 是
name | 用户名 | 是
account | 银行账户 | 是
deposit | 开户行 | 是

### create时的HTTP 请求

`POST http://localhost:3000/song/debit`
