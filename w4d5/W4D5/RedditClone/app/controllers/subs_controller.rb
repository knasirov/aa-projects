class SubsController < ApplicationController
  def new
    if current_user
      @sub = Sub.new
      render :new
    else
      redirect_to new_session_url
    end
  end

  def index
    @subs = Sub.all
    render :index
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id

    if @sub.save!
      redirect_to sub_url(@sub)
    else
      flash[:error] = @sub.errors.full_messages
      redirect_to new_sub_url
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    if current_user.id == @sub.moderator_id
      render :edit
    elsif current_user
      flash[:error] = ["You can't edit this sub!"]
      redirect_to subs_url
    else
      redirect_to new_session_url
    end
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:error] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
