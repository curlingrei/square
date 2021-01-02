class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit, :update, :update, :destroy]
  before_action :set_user, only: [:show, :edit]
  # prevent users from modifying guest_user
  before_action :guest_user?, only: [:edit, :update, :destroy]
  before_action :yourself?, only: [:show, :edit, :update, :destroy]
  def index; end

  def show
    @mybookposts = current_user.bookposts.page(params[:page]).per(8)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:light] = 'ユーザ登録が完了しました'
      redirect_to @user
    else
      render :new
    end
  end

  def edit; end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:light] = 'ユーザ情報を更新しました'
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    current_user.destroy
    flash[:light] = '退会しました'
    redirect_to :root
  end

  def mygroups
    @mygroups = current_user.groups.page(params[:page]).per(8)
  end

  def joining_groups
    @joining_groups = current_user.joining_groups.page(params[:page]).per(8)
  end

  def like_bookposts
    @like_bookposts = current_user.like_bookposts.page(params[:page]).per(8)
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar, :remove_avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end

  # guest_user or not
  def guest_user?
    if current_user.email == 'guest@user.com' && current_user.username == 'ゲストユーザー'
      flash[:light] = 'ゲストユーザーの情報を変更したり削除することはできません'
      redirect_back(fallback_location: root_path)
    end
  end

  def yourself?
    set_user
    redirect_back(fallback_location: root_path) unless @user == current_user
  end
end
