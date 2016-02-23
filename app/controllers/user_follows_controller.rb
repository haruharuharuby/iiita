class UserFollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_follow_to, only:[:destroy]
  before_action :user_follow_param, only:[:create]

  def create
    @follow = current_user.follow_to.build(user_follow_param)
    respond_to do |format|
      if @follow.save
        format.js{}
      else
        format.json { render @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @follow.destroy
        format.js{}
        format.json { render json: @follow, status: :ok }
      else
        format.json { render @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user_follow_to
      @follow = current_user.follow_to.find(params[:id])
    end

    def user_follow_param
      params.require(:user_follow).permit(:to_user_id)
    end
end
