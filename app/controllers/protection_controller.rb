class ProtectionController < ApplicationController
  skip_before_action :authorize
  
  # GET /protection
  def index
  end
end
