
class CommentsController < ApplicationController

    skip_before_action :verify_authenticity_token

    def index
        if params[:user_id]
            output = Comment.where(user_id: params[:user_id])
        elsif params[:artwork_id]
            output = Comment.where(artwork_id: params[:artwork_id])
        else
            output = Comment.all
        end
        render json: output
    end
  
    def create
      comment = Comment.new(comment_params)
      if comment.save
        render json: comment
      else
        render json: comment.errors.full_messages, status: :unprocessable_entity
      end
    end
  
    def destroy
      comment = Comment.find(params[:id])
      comment.destroy
      render json: comment
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:body, :user_id, :artwork_id)
    end
  
  end