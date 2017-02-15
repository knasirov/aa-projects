class CatCuddleRequestsController < ApplicationController
  def index
    if params[:cat_id]
      @cat_cuddle_requests = CatCuddleRequest.where(cat_id: params[:cat_id])
    else
      @cat_cuddle_requests = CatCuddleRequest.all
    end

    render :index
  end

  def show
    @cat_cuddle_request = CatCuddleRequest.find(params[:id])
    @cat_cuddle_request ? (render :show) : index
  end

  def new
    @cat_cuddle_request = CatCuddleRequest.new
    render :new
  end

  def edit
    @cat_cuddle_request = CatCuddleRequest.find_by(id: params[:id])
    @cat_cuddle_request ? (render :edit) : new
  end

  def create
    @cat_cuddle_request = CatCuddleRequest.new(cat_cuddle_request_params)
    if @cat_cuddle_request.save
      redirect_to cat_cuddle_request_url(@cat_cuddle_request)
    else
      render :new
    end
  end

  def update
    @cat_cuddle_request = CatCuddleRequest.find_by(id: params[:id])
    if @cat_cuddle_request.update(cat_cuddle_request_params)
      redirect_to cat_cuddle_request_url(@cat_cuddle_request)
    else
      render :edit
    end
  end

  private
  def cat_cuddle_request_params
    params.require(:cat_cuddle_request).permit(:cat_id, :start_date, :end_date)
  end
end
