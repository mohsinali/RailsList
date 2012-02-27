module SessionsHelper
  def sign_in(user)
    session[:user] = user
    flash[:status] = "You have been sigined in successfully."
  end
  
  def sign_out
    session[:user] = nil
    flash[:status] = "You have logged out successfully."
  end
end
