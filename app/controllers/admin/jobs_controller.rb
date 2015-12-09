class Admin::JobsController < ApplicationController
  respond_to :html

  def index
    @jobs = Job.page params[:page]
    respond_with(@jobs)
  end

  def show
    @job = Job.find(params[:id])
    respond_with(@job)
  end
end
