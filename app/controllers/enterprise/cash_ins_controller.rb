class Enterprise::CashInsController < ApplicationController
  respond_to :html

  def index
    @cash_ins = current_enterprise.cash_ins.page params[:page]
    respond_with(@cash_ins)
  end
end
