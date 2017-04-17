class ArtworksController < ApplicationController

  def index
    user = User.find(params[:user_id])
    owned_artwork = user.artworks
    shared_artwork = user.shared_artworks
    all_artwork = owned_artwork + shared_artwork
    render(json: all_artwork)
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
