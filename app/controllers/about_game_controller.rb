class AboutGameController < ApplicationController
  skip_before_action :authorize
  
  # GET /about_game
  def index
    @posts = Post.all.reverse
  end
end
