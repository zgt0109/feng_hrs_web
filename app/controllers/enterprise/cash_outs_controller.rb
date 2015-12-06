class Enterprise::CashOutsController < ApplicationController
  before_action :set_cash_out, only: [:show]

  respond_to :html

  def index
    @cash_outs = current_enterprise.cash_outs.page params[:page]
    respond_with(@cash_outs)
  end

  def show
    respond_with(@cash_out)
  end

  def new
    @cash_out = CashOut.new
    respond_with(@cash_out)
  end

  def create
    @cash_out = CashOut.new(cash_out_params)
    @cash_out.serial_inner = Time.now.strftime("%y%m%d") << rand(10000).to_s
    @cash_out.save
    respond_with(@cash_out, location: zhao_cash_outs_path)
  end

  private
    def set_cash_out
      @cash_out = CashOut.find(params[:id])
    end

    def cash_out_params
      params.require(:cash_out).permit(:enterprisename, :amount, :note, :serial_outer)
    end
end
