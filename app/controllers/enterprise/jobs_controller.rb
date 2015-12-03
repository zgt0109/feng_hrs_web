class Enterprise::JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @jobs = current_enterprise.jobs.page params[:page]
    respond_with(@jobs)
  end

  def show
    respond_with(@job)
  end

  def new
    @job = Job.new
    @job.job_commission_people.build
    respond_with(@job)
  end

  def edit
  end

  def create
    @job = current_enterprise.jobs.build(job_params)
    @job.save
    respond_with(@job, location: zhao_jobs_path)
  end

  def update
    @job.update(job_params)
    respond_with(@job, location: zhao_jobs_path)
  end

  def destroy
    @job.destroy
    respond_with(@job, location: zhao_jobs_path)
  end

  private
    def set_job
      @job = current_enterprise.jobs.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:name, :wage, :unit, :worktime, :royalty,
      :bonus, :channel, :wageday, :wageday_unit, :advance, :company_id, :contact_id,
      job_quantity_attributes: [:wish_male_count, :wish_female_count, :wish_unkown_count],
      job_commission_people_attributes: [:id, :unit, :gender, :amount, :deadline, :check, :remit, :_destroy])
    end
end
