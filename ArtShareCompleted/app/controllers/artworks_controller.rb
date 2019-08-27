class ArtworksController < ApplicationController
  
  def index
      if params[:user_id]
        artworks = Artwork.where(artist_id: params[:user_id])
        artworks += User.find(params[:user_id]).shared_artworks
        render json: artworks
      end
  end

  def create
      artwork = Artwork.new(artwork_params)

      if artwork.save
          render json: artwork
      else
          render json: artwork.errors.full_messages, status: :unprocessable_entity
      end
  end

  def show
      artwork = Artwork.find(params[:id])
      if artwork
          render json: artwork
      else
          render plain: "Artwork not found #{params[:id]}", status: :unprocessable_entity
      end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    if artwork.destroy
        render json: artwork
    else
        render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(artwork_params)
        render json: artwork
    else
        render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def favorite
    artwork = Artwork.find_by( id: params[:id], artist_id: params[:user_id])

    artwork.favorite = true
    artwork.save

    render json: artwork
  end

  def unfavorite
    artwork = Artwork.find_by( id: params[:id], artist_id: params[:user_id])

    artwork.favorite = false
    artwork.save

    render json: artwork
  end

  private

  def artwork_params
      params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

end