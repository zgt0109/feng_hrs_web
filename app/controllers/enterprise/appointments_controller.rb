class Enterprise::AppointmentsController < ApplicationController
  before_action :set_params, only: :appoint
  before_action :set_appointment, only: [:cancel, :state_transition]

  def index
    @appointments = current_enterprise.song.includes(:job, :labor).page params[:page]
  end

  def appoint
    Appointment.transaction do
      @labor_ids.each do |labor_id|
        Appointment.create(appointment_params(labor_id))
        Labor.find(labor_id).appoint!
      end
    end
    redirect_to song_appointments_path, notice: '送人成功'
  end

  def cancel
    Appointment.transaction do
      @appointment.destroy
      @appointment.labor.cancel!
    end
    redirect_to song_appointments_path, notice: '成功取消送人'
  end

  def state_transition
    begin
      Appointment.transaction do
        event = params[:transition_keyword]+'!'
        @appointment.send(event)
        @appointment.labor.send(event)
      end
    rescue
      flash[:error] = "状态切换失败"
    end
    redirect_to appointed_labors_zhao_labors_path
  end

  private
    def set_params
      @job = params[:job_id]
      @labor_ids = params[:labor_ids].split(',').uniq
    end

    def appointment_params(labor_id)
      { 'job_id' => @job, 'labor_id' => labor_id }
    end

    def set_appointment
      if params[:appointment_id]
        @appointment = current_enterprise.song.find(params[:appointment_id])
      else
        @appointment = Appointment.find(params[:id])
      end
    end
end
