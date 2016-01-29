class Enterprise::ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js, :json

  def index
    @contacts = current_enterprise.contacts.page params[:page]
    respond_with(@contacts)
  end

  def show
    respond_with(@contact)
  end

  def new
    @contact = Contact.new
    respond_with(@contact)
  end

  def edit
  end

  def create
    @contact = current_enterprise.contacts.build(contact_params)
    @contact.save
    respond_with(@contact, location: zhao_contacts_path)
  end

  def update
    @contact.update(contact_params)
    respond_with(@contact, location: zhao_contacts_path)
  end

  def destroy
    @contact.destroy
    respond_with(@contact, location: zhao_contacts_path)
  end

  private
    def set_contact
      @contact = current_enterprise.contacts.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :mobile, :gender)
    end
end
