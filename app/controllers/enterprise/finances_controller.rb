class Enterprise::FinancesController < ApplicationController
  def index
    @cash_in = current_enterprise.cash_ins
  end
end
