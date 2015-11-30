class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :init_layout

  before_action Proc.new{
    authenticate_enterprise! if params[:controller] =~ /^enterprise/
  }

  private
    def init_layout
      if params[:controller] =~ /^devise/
        'application'
      else
        params[:controller].split('/').first
      end
    end
end
