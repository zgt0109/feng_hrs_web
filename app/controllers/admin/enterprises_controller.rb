class Admin::EnterprisesController < ApplicationController
  respond_to :html

  def index
    @enterprises = Enterprise.page params[:page]
    respond_with(@enterprises)
  end

  def show
    @enterprise = Enterprise.find(params[:id])
    respond_with(@enterprise)
  end
end
