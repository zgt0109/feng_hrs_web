class Admin::LaborsController < ApplicationController
  respond_to :html

  def index
    @labors = Labor.all
    respond_with(@labors)
  end

  def show
    @labor = Labor.find(params[:id])
    respond_with(@labor)
  end
end
