Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :enterprises, controllers: {
    registrations: 'enterprise/registrations',
    sessions: 'enterprise/sessions'
  }

  devise_scope :enterprise do
    get 'enterprises/sign_up/:type' => 'enterprise/registrations#new', as: :sign_up
    post 'signup/send_sms' => 'enterprise/registrations#send_sms'
  end
  # 求职者
  scope module: 'applicant' do
    root 'dashboard#old'
    resources :pages, only: [:index, :show]
  end

  # 企业用户业务
  concern :enterpriseable do
    get 'profile' => 'profiles#index'
    resource :debit, only: [:new, :create, :show]
    resources :cash_ins, only: [:index]
  end

  # 招聘方
  namespace :zhao, module: 'enterprise' do
    root 'dashboard#zhao'
    concerns :enterpriseable
    resources :contacts
    resources :companies
    resources :jobs
    resources :labors, only: :index do
      get :appointed_labors, on: :collection
    end
    get '/transition/:id', to: 'appointments#state_transition', as: :transition
  end

  # 送人方
  namespace :song, module: 'enterprise' do
    root 'dashboard#song'
    concerns :enterpriseable
    resources :labors
    resources :jobs
    resources :appointments, only: [:index] do
      collection do
        get :appoint
        get :cancel
      end
    end
  end

  # 企业HR
  namespace :hr, module: 'enterprise' do
    root 'dashboard#hr'
    concerns :enterpriseable
  end

  # 运营管理
  namespace :admin do
    root 'dashboard#index'
    resources :enterprises, only: [:index, :show]
    resources :labors, only: [:index, :show]
    resources :contacts, only: [:index, :show]
    resources :companies, only: [:index, :show]
    resources :jobs, only: [:index, :show]
    resources :pages
    resources :cash_ins do
      member do
        get :confirm
        get :reject
      end
    end
  end

  mount ChinaCity::Engine => '/china_city'
  mount RuCaptcha::Engine => "/rucaptcha"
end
