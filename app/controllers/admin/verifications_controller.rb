class Admin::VerificationsController < ApplicationController
  before_action :set_verify_status, only: [:pass, :refuse]
  # 招聘方和经纪人验证
  def pass
    @verify_status.pass!
    flash[:success] = '通过审核'
    redirect_to :back
  end

  def refuse
    @verify_status.refuse!
    flash[:success] = '拒绝通过'
    redirect_to :back
  end
  #

  private
    def set_verify_status
      @verify_status = VerifyStatus.find(params[:id])
    end
end
