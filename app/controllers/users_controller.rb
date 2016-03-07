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

  private
    def set_user
      @user = User.find_by(name: params[:name])
    end
end
