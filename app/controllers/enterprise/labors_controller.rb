class Enterprise::LaborsController < ApplicationController
  before_action :set_labor, only: [:show, :edit, :update, :destroy]
  before_action :set_single_labor, only: :state_transition

  respond_to :html

  def index
    @job_id, @job_name = set_job_params
    @labors = current_enterprise.labors.page params[:page]
    respond_with(@labors)
  end

  def appointed_labors
    @labors = current_enterprise.zhao_labors.includes(:job).page params[:page]
    render :index
  end

  def show
    respond_with(@labor)
  end

  def new
    @labor = Labor.new
    @labor.build_intention
    respond_with(@labor)
  end

  def edit
  end

  def create
    @labor = current_enterprise.labors.build(labor_params)
    @labor.channel = 'web'
    @labor.save
    respond_with(@labor, location: song_labors_path)
  end

  def update
    @labor.update(labor_params)
    respond_with(@labor, location: song_labors_path)
  end

  def destroy
    @labor.destroy
    respond_with(@labor, location: song_labors_path)
  end

  private
    def set_labor
      @labor = current_enterprise.labors.find(params[:id])
    end

    # def set_single_labor
    #   @labor_single = Labor.find(params[:id])
    # end

    def set_job_params
      return params[:job_id], Job.find(params[:job_id]).try(:name) if params[:job_id]
    end

    def labor_params
      params.require(:labor).permit(
        :name, :mobile, :idcard, :province, :city, :district,
        intention_attributes: [:salary, :province, :city, :district, :position_ids]
      )
    end
end
