class Enterprise::DebitsController < ApplicationController
  respond_to :html, :json

  def new
    @debit = Debit.new
    respond_with(@debit)
  end

  # @TODO 多次绑定银行卡
  def create
    @debit = current_enterprise.build_debit(debit_params)
    @debit.save
    respond_with(@debit, location: song_profile_path)
  end

  private
    def debit_params
      params.require(:debit).permit(:bank_id, :name, :account, :deposit)
    end
end
