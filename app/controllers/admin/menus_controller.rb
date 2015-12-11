class Admin::MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @menus = Menu.page params[:page]
    respond_with(@menus)
  end

  def show
    respond_with(@menu)
  end

  def new
    @menu = Menu.new
    respond_with(@menu)
  end

  def edit
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.save
    respond_with(@menu, location: admin_menus_path)
  end

  def update
    @menu.update(menu_params)
    respond_with(@menu, location: admin_menus_path)
  end

  def destroy
    @menu.destroy
    respond_with(@menu, location: admin_menus_path)
  end

  private
    def set_menu
      @menu = Menu.find(params[:id])
    end

    def menu_params
      params.require(:menu).permit(:name, :domain, :uri, :icon)
    end
end
