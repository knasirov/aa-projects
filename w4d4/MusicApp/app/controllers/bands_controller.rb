class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash[:error] = @band.errors.full_messages
      redirect_to new_band_url
    end
  end

  def new
    render :new
  end

  def edit
    @band = Band.find_by(id: params[:id])
    render :edit
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def update
    @band = Band.find_by(band_params)
    @band.update(band_params)
  end

  def destroy

  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
