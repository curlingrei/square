class GroupsController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  def index
    @groups = Group.all.page(params[:page]).per(2)
  end

  def show
    @participate = current_user.participates.build
    @participated = Participate.find_by(group_id: @group.id)
    # @participated = Participate.find_by(group_id: @group.id)
    @participates = @group.participates
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
    if @group.update_attributes(groups_params)
      flash[:success] = 'グループの情報を更新しました'
      redirect_to @group
    else
       flash[:danger] = 'グループ情報の更新に失敗しました'
       render :edit
    end
  end

  def destroy
    @group.destroy
    flash[:success] = 'グループを削除しました'
    redirect_to groups_url
  end

  def readings
    @reading_groups = Group.where(first_category: '読書').page(params[:page]).per(10)
  end

  def studying_high
    @studying_high_groups = Group.where(first_category: '勉強(高校)').page(params[:page]).per(10)
  end

  def studying_univ
    @studying_univ_groups = Group.where(first_category: '勉強(大学・一般)').page(params[:page]).per(10)
  end

  def studying_language
    @studying_language_groups = Group.where(first_category: '勉強(語学)').page(params[:page]).per(10)
  end

  def studying_exam
    @studying_exam_groups = Group.where(first_category: '勉強(資格)').page(params[:page]).per(10)
  end

  def programing
    @programing_groups = Group.where(first_category: 'プログラミング').page(params[:page]).per(10)
  end

  private

  def groups_params
    params.require(:group).permit(:group_name, :first_category, :group_description, :default_img_ptn, :image, :remove_image, :user_id, :target_age, :target_sex, :target_number, :hope_time)
  end

  def set_group
    @group = Group.find_by(id: params[:id])
  end
end
