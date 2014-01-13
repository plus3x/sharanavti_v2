class UserAgreementController < ApplicationController
  skip_before_action :authorize
  
  # GET /user_agreement
  def index
  end
end
