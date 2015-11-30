class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :init_layout

  private
    def init_layout
      params[:controller].split('/').first
    end
end
