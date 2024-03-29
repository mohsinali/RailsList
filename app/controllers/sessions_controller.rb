class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end
  
  def create
    email = params[:session][:email]
    password = params[:session][:password]
    
    user = User.authenticate(email, password)    
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = 'Sign in'
      render 'new'
    else
      sign_in(user)
      redirect_to user_path(user.id)
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
  
end
