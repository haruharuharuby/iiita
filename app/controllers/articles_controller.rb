class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:edit, :update, :destroy]
  before_action :set_article_view, only: [:show, :markdown]
  def index
    @articles = Article.page(params[:page])
  end

  def show
  end

  def new
    @article = current_user.articles.build
  end

  def edit
  end

  def create
    @article = current_user.articles.build(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_article
      @article = current_user.articles.find(params[:id])
    end

    def set_article_view
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body, :publication, :tag_list)
    end
end
