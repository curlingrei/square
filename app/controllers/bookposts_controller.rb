class BookpostsController < ApplicationController
  before_action :set_bookpost, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in
  def index
    @bookposts = Bookpost.all.page(params[:page]).per(2)
  end

  def show
    @booklike = current_user.booklikes.new
    @likedbookpost = Booklike.find_by(bookpost_id: @bookpost.id)
    @bookcomment = current_user.bookcomments.new
    @bookcomments = @bookpost.bookcomments
    @commentlike = current_user.commentlikes.new
  end

  def new
    @bookpost = current_user.bookposts.build
  end

  def create
    @bookpost = current_user.bookposts.build(bookpost_params)
    if @bookpost.save
      flash[:success] = '投稿しました'
      redirect_to @bookpost
    else
      flash[:danger] = '投稿に失敗しました'
      render :new
    end
  end

  def edit; end

  def update
    if @bookpost.update_attributes(bookpost_params)
      flash[:success] = '投稿内容を更新しました'
      redirect_to @bookpost
    else
      flash[:danger] = '更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @bookpost.destroy
    flash[:success] = '投稿を削除しました'
    redirect_to action: :index
  end

  def bookpost_params
    params.require(:bookpost).permit(:title, :description, :category, :bookimage, :remove_bookimage)
  end

  def set_bookpost
    @bookpost = Bookpost.find_by(id: params[:id])
  end
end
