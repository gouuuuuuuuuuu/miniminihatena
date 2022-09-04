class Admin::CommentsController < ApplicationController

def destroy
  @comment= Comment.find(params[:id])
  @comment.destroy
  redirect_to admin_post_path(@comment.post)
end

private
 def comment_params
    params.require(:comment).permit(:comment_content, :post_id)
 end
end

