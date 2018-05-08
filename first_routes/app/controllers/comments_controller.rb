class CommentsController < ApplicationController
  def index
    # comment = Artwork.find(params[:artwork_id]).comments
    if params[:artwork_id]
      comment = Comment.where(artwork_id: params[:artwork_id])
    elsif params[:user_id]
      comment = Comment.where(author_id: params[:user_id])
    else
      comment = Comment.all
    end

    render json: comment
  end

  def show
    comment = Comment.find(comment_params)

    render json: comment
  end

  def destroy
  end

  def create
    comment = Comment.new(comment_params)

    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :artwork_id, :body)
  end
end
