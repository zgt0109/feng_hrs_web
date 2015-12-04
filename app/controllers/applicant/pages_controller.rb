class Applicant::PagesController < ApplicationController
  before_action :get_pages_title
  def index

  end

  def show
    @page = Page.friendly.find(params[:id])
  end

  private
    def get_pages_title
      @titles = Page.select(:name, :slug).all
    end
end
