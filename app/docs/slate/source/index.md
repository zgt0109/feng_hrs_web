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
  "updated_at":"2016-01-27T07:33:29.683Z"
}
```
### 跳转到show页面的HTTP 请求

`GET http://localhost:3000/song/labors/<ID>`

### URL 参数

参数 | 说明
--------- | -----------
ID | 根据ID查看工友

## 新增-new、create

### 跳转到new页面的HTTP 请求

`GET http://localhost:3000/song/labors/new`

### URL 参数

参数 | 说明 | 新增是否必填
--------- | ----------- | -----------
name | 工友名称 | 是
mobile | 工友电话 | 是
idcard | 身份证号码 | 是
province | 现居住省 | 是
city | 现居住市 | 是
district | 现居住县 | 是

> create的POST JSON数据:

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
}
```
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
