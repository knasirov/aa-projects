class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      login(@user)
      redirect_to user_url(@user)
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find(params[:id])
    if current_user == @user
      render :show
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_session_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
