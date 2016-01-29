class Enterprise::CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js, :json

  def index
    @companies = current_enterprise.companies.page params[:page]
    respond_with(@companies)
  end

  def show
    respond_with(@company)
  end

  def new
    @company = Company.new
    respond_with(@company)
  end

  def edit
  end

  def create
    @company = current_enterprise.companies.build(company_params)
    @company.save
    respond_with(@company, location: zhao_companies_path)
  end

  def update
    @company.update(company_params)
    respond_with(@company, location: zhao_companies_path)
  end

  def destroy
    @company.destroy
    respond_with(@company, location: zhao_companies_path)
  end

  private
    def set_company
      @company = current_enterprise.companies.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :province, :city, :district, :address, :introduction)
    end
end
