class GroupcommentlikesController < ApplicationController
  before_action :set_target_comment
  before_action :require_user_logged_in
  def create
    current_user.group_comment_like(@target_comment)
  end

  def destroy
    current_user.group_comment_dislike(@target_comment)
    @groupcommentlike = current_user.groupcommentlikes.new
  end

  private

  def set_target_comment
    @target_comment = Groupcomment.find_by(id: params[:groupcomment_id])
    @group = Group.find_by(id: params[:group_id])
  end
end
