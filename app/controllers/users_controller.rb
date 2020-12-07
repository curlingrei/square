class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(1)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザ登録が完了しました'
      redirect_to @user
    else
      flash[:danger] = 'ユーザの登録に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
