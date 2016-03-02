class TagFollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tag_follow, only:[:destroy]

  def create
    @tag_follow = current_user.tag_follows.build(tag_follow_param)
    @tag_follow.save
  end

  def destroy
    @tag_follow.delete
  end

  private
    def set_tag_follow
      @tag_follow = current_user.tag_follows.find(params[:id])
    end

    def tag_follow_param
      params.require(:tag_follow).permit(:tag_id)
    end
end
