class GoalsController < ApplicationController
  before_action :require_signed_in

  def new
    @goal = Goal.new
    render :new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def show
    @goal = Goal.find(params[:id])
    render :show
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy unless @goal.nil?
    redirect_to goals_url
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      flash.now[:success] = ["Goal Updated!"]
      render :show
    else
      flash.now[:error] = @goal.errors.full_messages
      render :show
    end
  end



  def index
    @goals = current_user.goals
    render :index
  end

  def goal_params
    params.require(:goal).permit(:title, :details, :private, :completed)
  end

end
