class ParticipatesController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_group, only: [:create, :destroy]
  def create
    current_user.join_group(@group)
    @participated = Participate.find_by(group_id: @group.id)
  end

  def destroy
    @participate = current_user.participates.build
    current_user.exit_group(@group)
  end

  private

  def set_group
    @group = Group.find_by(id: params[:group_id])
  end
end
