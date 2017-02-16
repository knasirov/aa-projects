class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def new
    return redirect_to root_path if current_user
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save!
      login_user(@user)
      redirect_to cats_url
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_user_url
    end

  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
