class SessionsController < ApplicationController

  def new
    return redirect_to root_path if current_user
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if user
      user.reset_session_token!
      session[:session_token] = user.session_token
      redirect_to root_path
    else
      flash[:error] = ["Invalid credentials"]
      redirect_to new_session_url
    end
  end

  def destroy
    if current_user
      logout(current_user)
      redirect_to root_path
    end
  end

end
