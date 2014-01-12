class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]
  
  # GET /login
  def new
  end

  # POST /login?email=user@mail.com&password=secret
  def create
    user = 1 # User.api_authontificated?(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user
      redirect_to root_url
    else
      redirect_to root_url, notice: "Invalid user/password combination"
    end
  end

  # DELETE /logout
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out"
  end
end
