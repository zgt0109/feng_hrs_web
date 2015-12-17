class Enterprise::VerificationZhaosController < ApplicationController
  before_action :set_verification_zhao, only: [:edit, :update]

  respond_to :html

  def new
    @verification_zhao = VerificationZhao.new
    respond_with(@verification_zhao)
  end

  def edit
  end

  def create
    @verification_zhao = current_enterprise.build_verification_zhao(verification_zhao_params)
    VerificationZhao.transaction do
      @verification_zhao.save
      current_enterprise.apply!
    end
    respond_with(@verification_zhao, location: root_path)
  end

  def update
    VerificationZhao.transaction do
      @verification_zhao.update(verification_zhao_params)
      current_enterprise.reapply!
    end
    respond_with(@verification_zhao, location: root_path)
  end

  private
    def set_verification_zhao
      @verification_zhao = current_enterprise.verification_zhao
    end

    def verification_zhao_params
      params.require(:verification_zhao).permit(:image_url, :name, :short_name,
                     :nature, :industry, :scale, :mobile, :website, :province,
                     :city, :district, :address, :introduction)
    end
end
