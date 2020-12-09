class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit, :update, :update, :destroy]
  before_action :set_user, only: [:show, :edit]
  #ゲストユーザには情報の更新や退会処理を認めない
  before_action :guest_user?, only: [:edit, :update, :destroy]
  def index
    @users = User.all.page(params[:page]).per(1)
  end

  def show; end

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

  def edit; end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:success] = 'ユーザ情報を更新しました'
      redirect_to @user
    else
        flash[:danger] = 'ユーザ情報の更新に失敗しました'
        render :edit
    end
  end

  def destroy
    current_user.destroy
    flash[:success] = '退会しました'
    redirect_to :root
  end
  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
  #ゲストユーザかどうかの判定
  def guest_user?
    if current_user.email = 'guest@user.com' && current_user.password = password = 'guestuser'
      flash[:warning] = 'ゲストユーザーの情報を変更したり削除することはできません'
      redirect_back(fallback_location: root_path)
    end
  end
end
