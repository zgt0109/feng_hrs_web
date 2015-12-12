require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :init_layout

  before_action Proc.new{
    authenticate_enterprise! if params[:controller] =~ /^enterprise/
    authenticate_admin! if params[:controller] =~ /^admin/
  }

  before_action :setup_menu

  private
    def init_layout
      case params[:controller]
      when /^devise/
        'applicant_old'
      else
        params[:controller].split('/').first
      end
    end


    def setup_menu
      @_menus = Menu.with_domain( request.path.slice(/zhao|song|hr|admin/) )
    end
end
