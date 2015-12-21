class Enterprise::CashInsController < ApplicationController
  respond_to :html

  def index
    @cash_ins = current_enterprise.cash_ins.page params[:page]
    respond_with(@cash_ins)
  end

  def new
    @cash_in = CashIn.new
    respond_with(@cash_in)
  end

  def create
    @cash_in = CashIn.new(cash_in_params)
    @cash_in.channel = 'bank'
    @cash_in.serial_inner = Time.now.strftime("%y%m%d") << rand(10000).to_s
    @cash_in.save
    respond_with(@cash_ins, location: song_cash_ins_path)
  end

  private
    def cash_in_params
      params.require(:cash_in).permit(:enterprisename, :amount, :note, :serial_outer)
    end
end
