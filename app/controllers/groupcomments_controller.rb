class GroupcommentsController < ApplicationController
  before_action :set_groupcomments, only: [:create]
  before_action :require_user_logged_in
  def create
    @groupcommentlike = current_user.groupcommentlikes.new
    @groupcomment = current_user.groupcomments.build(groupcomment_params)
    true if @groupcomment.save
  end

  def destroy
    @target_comment = Groupcomment.find_by(id: params[:id])
    current_user.delete_groupcomment(@target_comment)
    @group = @target_comment.group
    @groupcomments = @group.groupcomments
    @groupcommentlike = current_user.groupcommentlikes.new
  end

  def groupcomment_params
    params.require(:groupcomment).permit(:comment, :group_id)
  end

  def set_groupcomments
    @group = Group.find(params[:group_id])
    @groupcomments = @group.groupcomments
  end
end
