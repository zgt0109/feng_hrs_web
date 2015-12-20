class Admin::EnterprisesController < ApplicationController
  before_action :set_enterprise, only: [:show, :show_zhao_verification, :show_agent_verification]
  respond_to :html

  def index
    @enterprises = Enterprise.page params[:page]
    respond_with(@enterprises)
  end

  def show
    respond_with(@enterprise)
  end

  def show_zhao_verification
    @zhao_verification = @enterprise.verification_zhao
    render 'show_zhao_verification'
  end

  def show_agent_verification
    @agent_verification = @enterprise.verification_agent
    render 'show_agent_verification'
  end

  private
    def set_enterprise
      @enterprise = Enterprise.find(params[:id])
    end
end
