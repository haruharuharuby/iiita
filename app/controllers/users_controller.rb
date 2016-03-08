class UsersController < ApplicationController
  before_action :set_user

  def show
  end

  def following_tags
  end

  def following_users
  end

  def followed_users
  end

  def follow
    @user_follow = current_user.follow_to.build(to_user_id: @user.id)
    logger.debug(@user_follow.inspect)
    respond_to do |format|
      if @user_follow.save
        format.js{}
      end
    end
  end

  def unfollow
    @user_follow = current_user.follow_to.find_by(to_user_id: @user)
    respond_to do |format|
      if @user_follow.destroy
        format.js{}
      end
    end
  end

  private
    def set_user
      @user = User.find_by(name: params[:name])
    end
end
