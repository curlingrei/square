class BooklikesController < ApplicationController
  before_action :set_bookpost
  def create
    current_user.booklike(@bookpost)
    flash[:success] = 'いいねしました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.bookdislike(@bookpost)
    flash[:primary] = 'いいねを解除しました'
    redirect_back(fallback_location: root_path)
  end

  private

  def set_bookpost
    @bookpost = Bookpost.find(params[:bookpost_id])
  end
end
