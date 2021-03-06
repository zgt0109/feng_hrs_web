class Enterprise::JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if request.path.slice(/zhao|song/) == 'song'
      @labor_ids = params[:labor_ids]
      @labor_names = get_labor_names if params[:labor_ids]
      @jobs = Job.page params[:page]
    else
      @jobs = current_enterprise.jobs.page params[:page]
    end
    respond_with(@jobs)
  end

  def show
    respond_with(@job)
  end

  def new
    @job = Job.new
    @job.job_commission_people.build
    @job.job_commission_days.build
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
      # params[:job][:job_commission_days_attributes].map(&:_destroy = true ) if params[:commission_flg] == 'person'
      # params[:job][:job_commission_people_attributes].map(&:_destroy = true) if params[:commission_flg] == 'day'
      params.require(:job).permit(:name, :wage, :unit, :worktime, :royalty,
      :bonus, :channel, :wageday, :wageday_unit, :advance, :company_id, :contact_id,
      job_quantity_attributes: [:wish_male_count, :wish_female_count, :wish_unkown_count],
      job_commission_people_attributes: [:id, :unit, :gender, :amount, :deadline, :check, :remit, :_destroy],
      job_commission_days_attributes: [:id, :gender, :deadline, :amount, :_destroy])
    end

    def get_labor_names
      Labor.find(params[:labor_ids].split(',').uniq).map(&:name).join('、')
    end
end
