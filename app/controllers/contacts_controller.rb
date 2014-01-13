class ContactsController < ApplicationController
  skip_before_action :authorize
  
  # GET /contacts
  def index
  end
end
