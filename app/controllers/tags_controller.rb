class TagsController < ApplicationController
  before_action :set_tag, only:[:show, :edit, :update, :delete]

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

  private
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_param
      params.require(:tag).permit(:name)
    end
end
