class Enterprise::AppointmentsController < ApplicationController
  before_action :set_params, only: :appoint
  before_action :set_appointment, only: :cancel

  def index
    @appointments = current_enterprise.song.includes(:job, :labor).page params[:page]
  end

  def appoint
    Appointment.transaction do
      @labor_ids.each do |labor_id|
        Appointment.create(appointment_params(labor_id))
        Labor.find(labor_id).baoming!
      end
    end
    redirect_to song_appointments_path, notice: '送人成功'
  end

  def cancel
    Appointment.transaction do
      @appointment.destroy
      @appointment.labor.cancel_baoming!
    end
    redirect_to song_appointments_path, notice: '成功取消送人'
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
      @appointment = current_enterprise.song.find(params[:appointment_id])
    end

end
