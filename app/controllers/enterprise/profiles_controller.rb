class Enterprise::ProfilesController < ApplicationController
  def index
    @debit = current_enterprise.debit
  end
end
