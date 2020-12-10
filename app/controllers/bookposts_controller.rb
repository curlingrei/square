class BookpostsController < ApplicationController
  def index
    @bookposts = Bookpost.all.page(params[:page]).per(5)
  end

  def show
    @bookpost = Bookpost.find(params[:id])
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

  def edit
  end

  def update
  end

  def destroy
  end

  def bookpost_params
    params.require(:bookpost).permit(:title, :description, :category)
  end
end
