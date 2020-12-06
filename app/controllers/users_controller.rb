class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(1)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
