Rails.application.routes.draw do
  devise_for :enterprises
  # 求职者
  scope module: 'applicant' do
    root 'dashboard#index'
  end

  # 企业用户业务
  concern :enterpriseable do
  end

  # 招聘方
  namespace :zhao, module: 'enterprise' do
    root 'dashboard#zhao'
    concerns :enterpriseable
    resources :contacts
  end

  # 送人方
  namespace :song, module: 'enterprise' do
    root 'dashboard#song'
    concerns :enterpriseable
    resources :labors
  end

  # 企业HR
  namespace :hr, module: 'enterprise' do
    root 'dashboard#hr'
    concerns :enterpriseable
  end

  # 运营管理
  namespace :admin do
    root 'dashboard#index'
  end

  mount ChinaCity::Engine => '/china_city'
end
