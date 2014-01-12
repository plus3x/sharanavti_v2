class SecurityController < ApplicationController
  skip_before_action :authorize
  
  # GET /security
  def index
  end
end
