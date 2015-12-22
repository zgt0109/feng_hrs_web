class Enterprise::VerificationAgentsController < ApplicationController
  before_action :set_verification_agent, only: [:edit, :update, :pass, :refuse]

  respond_to :html

  def new
    if agent=current_enterprise.verification_agent then
      return redirect_to edit_song_verification_agent_path(agent)
    end
    @verification_agent = current_enterprise.build_verification_agent
    respond_with(@verification_agent)
  end

  def edit
  end

  def create
    @verification_agent = current_enterprise.build_verification_agent(verification_agent_params)
    @verification_agent.save
    respond_with(@verification_agent, location: root_path)
  end

  def update
    @verification_agent.update(verification_agent_params)
    respond_with(@verification_agent, location: root_path)
  end

  private
    def set_verification_agent
      @verification_agent = current_enterprise.verification_agent
    end

    def verification_agent_params
      params.require(:verification_agent).permit(:front, :back, :name, :idcard)
    end
end
