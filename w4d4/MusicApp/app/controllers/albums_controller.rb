class AlbumsController < ApplicationController

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash[:error] = @album.errors.full_messages
      redirect_to new_band_album_url
    end
  end

  def new
    @album = Album.new
    render :new
  end

  def edit
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def update
    @album = Album.find_by(id: params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash[:error] = @album.errors.full_messages
      redirect_to edit_album_url
    end
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    redirect_to band_url(@album.band)
    @album.destroy
  end

  private

  def album_params
    params.require(:album).permit(:name, :band_id)
  end
end
