class Admin::LaborsController < ApplicationController
  respond_to :html

  def index
    @labors = Labor.page params[:page]
    respond_with(@labors)
  end

  def show
    @labor = Labor.find(params[:id])
    respond_with(@labor)
  end
end
