class TagsController < ApplicationController
  before_action :authenticate_user!, only:[:edit, :update, :delete, :follow, :unfollow]
  before_action :set_tag, only:[:show, :edit, :update, :delete, :follow, :unfollow]

  def index
    @tags = Tags.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  def follow
    @tag_follow = current_user.tag_follows.build(tag: @tag)
    respond_to do |format|
      if @tag_follow.save
        format.js{}
        format.html{ redirect_to @tag, status: :ok, notice: "success"}
      end
    end
  end

  def unfollow
    @tag_follow = TagFollow.find_by(user: current_user, tag: @tag)
    respond_to do |format|
      if @tag_follow.destroy
        format.js{}
        format.html { redirect_to @tag, status: :ok, notice: "success" }
      end
    end
  end

  private
    def set_tag
      @tag = Tag.find_by(name: params[:name])
    end

    def tag_param
      params.require(:tag).permit(:name)
    end
end
