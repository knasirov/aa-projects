class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(user_params[:email], user_params[:password])
    if user
      login(user)
      redirect_to user_url(user)
    else
      flash[:error] = ["Couldn't find a user with given email/password combination."]
      redirect_to new_session_url
    end
  end

  def destroy
    logout
    render :new
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
