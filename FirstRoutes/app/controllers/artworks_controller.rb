class ArtworksController < ApplicationController

  def index
    artwork = Artwork.all
    render json: artwork
  end

  def create
    artwork = Artwork.new(artworks_param)
    if artwork.save
      render json: artwork
    else
      render(
        json: artwork.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(artworks_param)
      render json: artwork
    else
      render(
        json: artwork.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    render json: artwork
  end

  private

  def artworks_param
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
