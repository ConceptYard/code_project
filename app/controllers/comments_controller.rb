class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]

    respond_to do |format|
      if @comment.save
        format.js
      else
        format.js { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :author_id, :post_id)
    end
end
