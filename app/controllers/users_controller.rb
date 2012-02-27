class UsersController < ApplicationController
  
  def index
    @users = User.find(:all)
  end
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "Successfully deleted user."
    redirect_to :action => "index"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      #flash[:notice] = "You have been signed up successfully."
      redirect_to(@user, :notice => "User saved.")      
    else
      flash[:error] = "Error!"
      render :action => 'new'
    end
  end
end
