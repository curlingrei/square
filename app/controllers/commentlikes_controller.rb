class CommentlikesController < ApplicationController
  before_action :set_target_comment, only: [:create, :destroy]
  def create
    current_user.comment_like(@target_comment)
  end

  def destroy
    current_user.comment_dislike(@target_comment)
    @commentlike = current_user.commentlikes.new
  end

  def set_target_comment
    @target_comment = Bookcomment.find_by(id: params[:bookcomment_id])
    @bookpost = Bookpost.find_by(id: params[:bookpost_id])
  end
end
