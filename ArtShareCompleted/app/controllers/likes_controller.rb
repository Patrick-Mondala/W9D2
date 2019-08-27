class LikesController < ApplicationController
    def index
        if params[:user_id]
			likes = User.find(params[:user_id]).likes
            
            if likes
                liked = likes.map do |like|
                    type = like.likeable_type
                    if type == "Comment"
                        Comment.find(like.likeable_id)
                    elsif type == "Artwork"
                        Artwork.find(like.likeable_id)
                    end
                end
				render json: liked
            else
                render json: likes.errors.full_messages, status: :unprocessable_entity
            end
        elsif params[:artwork_id]
            likes = Artwork.find(params[:artwork_id]).likes
			if likes
                users = likes.map do |like|
                    User.find(like.user_id)
                end
                render json: users
            else
                render json: likes.errors.full_messages, status: :unprocessable_entity
            end
        elsif params[:comment_id]
            likes = Comment.find(params[:comment_id]).likes
            if likes
                users = likes.map do |like|
                    User.find(like.user_id)
                end
                render json: users
            else
                render json: likes.errors.full_messages, status: :unprocessable_entity
            end
        else
            render plain: "Unspecified paramaters", status: :unprocessable_entity

        end
    end

    def create
        like = Like.new(like_params)
        
        user = User.where(id: like_params[:user_id])
        if user.empty?
            render plain: "User not found, like couldn't be added", status: :unprocessable_entity
        elsif params[:artwork_id]
            artwork = Artwork.find(params[:artwork_id])
            #check if user exists same in comments_controller#create
                like = artwork.likes.create(user_id: like_params[:user_id])
                if like.valid?
                    render json: like
                else
                    render json: like.errors.full_messages, status: :unprocessable_entity
                end
        elsif params[:comment_id]
            comment = Comment.find(params[:comment_id])
            #check if user exists same in comments_controller#create
			like = comment.likes.create(user_id: like_params[:user_id])
			if like.valid?
                render json: like
            else
                render json: like.errors.full_messages, status: :unprocessable_entity
            end
        else
            render plain: "Unspecified paramaters #{like}", status: :unprocessable_entity
        end
    end

	private
    def like_params
        params.require(:like).permit(:user_id, :likeable_id, :likeable_type)
	end
	


end