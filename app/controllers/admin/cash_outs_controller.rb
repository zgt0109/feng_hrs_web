class Admin::CashOutsController < ApplicationController
  before_action :set_cash_out, only: [:show, :edit, :update, :destroy, :confirm, :reject]

  respond_to :html

  def index
    @cash_outs = CashOut.get_cash_outs_by_state(params[:state]).page params[:page]
    respond_with(@cash_outs)
  end

  def show
    respond_with(@cash_out)
  end

  def edit
  end

  def update
    @cash_out.update(cash_out_params)
    @cash_out.pend! if @cash_out.rejected?
    respond_with(@cash_out, location: admin_cash_outs_path)
  end

  def destroy
    @cash_out.destroy
    respond_with(@cash_out, location: admin_cash_outs_path)
  end

  def confirm
    @cash_out.confirm!
    flash[:confirm] = '通过'
    redirect_to admin_cash_outs_path
  end

  def reject
    @cash_out.reject!
    flash[:success] = '拒绝'
    redirect_to admin_cash_outs_path
  end

  def set_cash_out
    @cash_out = CashOut.find(params[:id])
  end

  def cash_out_params
    params.require(:cash_out).permit(:enterprisename, :amount, :note, :serial_outer)
  end
end
