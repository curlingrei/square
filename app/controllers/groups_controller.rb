class GroupsController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  def index
    @groups = Group.all.page(params[:page]).per(6)
  end

  def show
  end

  def new
    @group = current_user.groups.build
  end

  def create
    @group = current_user.groups.build(groups_params)
    if @group.save
      flash[:success] = 'グループを作成しました'
      redirect_to @group
    else
       flash[:danger] = 'グループの作成に失敗しました'
       render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def groups_params
    params.require(:group).permit(:group_name, :first_category, :second_category, :group_description, :default_img_ptn, :user_id)
  end

  def set_group
    @group = Group.find_by(id: params[:id])
  end
end
