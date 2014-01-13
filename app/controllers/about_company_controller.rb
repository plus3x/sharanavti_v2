class AboutCompanyController < ApplicationController
  skip_before_action :authorize
  
  # GET /about_company
  def index
    @posts = Post.all.reverse
  end
end
