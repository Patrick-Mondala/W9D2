class CommentsController < ApplicationController

    def index
      if params[:author_id]
        comments = Comment.where(author_id: params[:author_id])
        render json: comments
      elsif params[:artwork_id]
        comments = Comment.where(artwork_id: params[:artwork_id])
        render json: comments
      end
    end

    def create
      comment = Comment.new(comment_params)
      #check if user exists
      user = User.where(id: comment_params[:author_id])
      if !user.empty?
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
      else
        render plain: "User not found", status: :unprocessable_entity
      end
    end

    def destroy
        comment = Comment.find(params[:id])
        if comment.destroy
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:author_id, :artwork_id, :body)
    end
end