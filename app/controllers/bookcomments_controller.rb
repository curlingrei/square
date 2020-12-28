class BookcommentsController < ApplicationController
  before_action :set_bookcomments, only: [:create]
  before_action :require_user_logged_in
  def create
    @commentlike = current_user.commentlikes.new
    @bookcomment = current_user.bookcomments.build(bookcomment_params)
    true if @bookcomment.save
  end

  def update; end

  def destroy
    @target_comment = Bookcomment.find_by(id: params[:id])
    current_user.delete_bookcomment(@target_comment)
    @bookpost = @target_comment.bookpost
    @bookcomments = @bookpost.bookcomments
    @commentlike = current_user.commentlikes.new
  end

  def bookcomment_params
    params.require(:bookcomment).permit(:message, :bookpost_id)
  end

  def set_bookcomments
    @bookpost = Bookpost.find(params[:bookpost_id])
    @bookcomments = @bookpost.bookcomments
  end
end
