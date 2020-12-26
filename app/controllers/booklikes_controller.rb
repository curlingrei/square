class BooklikesController < ApplicationController
  before_action :set_bookpost

  def create
    current_user.booklike(@bookpost)
    @likedbookpost = Booklike.find_by(bookpost_id: @bookpost.id)
  end

  def destroy
    current_user.bookdislike(@bookpost)
    @booklike = current_user.booklikes.new
  end

  private

  def set_bookpost
    @bookpost = Bookpost.find(params[:bookpost_id])
  end
end
