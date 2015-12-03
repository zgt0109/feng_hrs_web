class Admin::CompaniesController < ApplicationController
  respond_to :html

  def index
    @companies = Company.all
    respond_with(@companies)
  end

  def show
    @company = Company.find(params[:id])
    respond_with(@company)
  end
end
