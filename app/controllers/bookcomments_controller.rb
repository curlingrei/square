class BookcommentsController < ApplicationController
  before_action :set_bookcomments, only: [:create]
  def create
    @commentlike = current_user.commentlikes.new
    @bookcomment = current_user.bookcomments.build(bookcomment_params)
    true if @bookcomment.save

      # flash[:success] = 'コメントを投稿しました'
      # redirect_back(fallback_location: root_path)
  end

  def update
    @target_comment = Bookcomment.find_by(id: params[:id])
    if @target_comment.update_attributes(bookcomment_params)
      flash[:warning] = 'コメントを更新しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @target_comment = Bookcomment.find_by(id: params[:id])
    current_user.delete_bookcomment(@target_comment)
    @bookpost = @target_comment.bookpost
    @bookcomments = @bookpost.bookcomments
    @commentlike = current_user.commentlikes.new
    # flash[:primary] = 'コメントを削除しました'
    # redirect_back(fallback_location: root_path)
  end

  def bookcomment_params
    params.require(:bookcomment).permit(:message, :bookpost_id)
  end

  def set_bookcomments
    @bookpost = Bookpost.find(params[:bookpost_id])
    @bookcomments = @bookpost.bookcomments
  end
end
