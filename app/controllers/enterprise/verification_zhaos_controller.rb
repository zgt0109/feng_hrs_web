class Enterprise::VerificationZhaosController < ApplicationController
  before_action :set_verification_zhao, only: [:edit, :update, :pass, :refuse]

  respond_to :html

  def new
    if current_enterprise.verification_zhao
      return redirect_to edit_zhao_verification_zhao_path(current_enterprise.verification_zhao)
    end
    @verification_zhao = VerificationZhao.new
    respond_with(@verification_zhao)
  end

  def edit
  end

  def create
    @verification_zhao = current_enterprise.build_verification_zhao(verification_zhao_params)
    @verification_zhao.save
    respond_with(@verification_zhao, location: root_path)
  end

  def update
    @verification_zhao.update(verification_zhao_params)
    respond_with(@verification_zhao, location: root_path)
  end

  def pass
    @verification_zhao.verify_status.pass!
    flash[:success] = '通过审核'
    redirect_to :back
  end

  def refuse
    @verification_zhao.verify_status.refuse!
    flash[:success] = '拒绝通过'
    redirect_to :back
  end

  private
    def set_verification_zhao
      @verification_zhao = current_enterprise.verification_zhao
    end

    def verification_zhao_params
      params.require(:verification_zhao).permit(:image_url, :name, :short_name,
                     :nature, :industry_id, :scale, :mobile, :website, :province,
                     :city, :district, :address, :introduction)
    end
end
