class SessionsController < Devise::SessionsController
  #after_sign_in_path_for is called by devise
  def after_sign_in_path_for(user)
      "/signedinuserprofile" #here we provide the path for the user's profile
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in
      log_in user
      redirect_to user
    else
      # Display error message
      flash.now[:danger] = 'Invalid email Id / Password'
      render 'new'
    end
  
  
  def destroy
    log_out
    redirect_to root_url
  end
  
  def accInfo
    redirect_to current_user
  end
  
  
end