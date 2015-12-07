class Admin::CashInsController < ApplicationController
  before_action :set_cash_in, only: [:show, :edit, :update, :destroy, :confirm, :reject]

  respond_to :html, :js

  def index
    @cash_ins = CashIn.get_cash_ins_by_state(params[:state]).page params[:page]
    respond_with(@cash_ins)
  end

  def show
  end

  def new
    @cash_in = CashIn.new
    respond_with(@cash_in)
  end

  def edit
  end

  def create
    @cash_in = CashIn.new(cash_in_params)
    @cash_in.channel = 'bank'
    @cash_in.serial_inner = Time.now.strftime("%y%m%d") << rand(10000).to_s
    @cash_in.save
    respond_with(@cash_in, location: admin_cash_ins_path)
  end

  def update
    @cash_in.update(cash_in_params)
    @cash_in.pend! if @cash_in.rejected?
    respond_with(@cash_in, location: admin_cash_ins_path)
  end

  def destroy
    @cash_in.destroy
    respond_with(@cash_in, location: admin_cash_ins_path)
  end

  def confirm
    @cash_in.confirm!
    flash[:confirm] = '通过'
    redirect_to admin_cash_ins_path
  end

  def reject
    @cash_in.reject!
    flash[:success] = '拒绝'
    redirect_to admin_cash_ins_path
  end

  private
    def set_cash_in
      @cash_in = CashIn.find(params[:id])
    end

    def cash_in_params
      params.require(:cash_in).permit(:enterprisename, :amount, :note, :serial_outer)
    end
end
