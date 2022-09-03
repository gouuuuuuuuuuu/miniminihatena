class Admin::CommentsController < ApplicationController

  private
  def comment_params
    params.require(:comment).permit(:comment_content, :post_id)
  end
end

