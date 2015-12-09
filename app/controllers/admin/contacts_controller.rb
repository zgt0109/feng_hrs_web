class Admin::ContactsController < ApplicationController
  respond_to :html

  def index
    @contacts = Contact.page params[:page]
    respond_with(@contacts)
  end

  def show
    @contact = Contact.find(params[:id])
    respond_with(@contact)
  end
end
