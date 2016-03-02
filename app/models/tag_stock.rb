class TagStock
  def initialize(tag)
    @tag = tag
  end

  def recent_stocked_articles
    Article.includes(:stocks).where(id: @tag.articles).order("stocks.id desc")
  end
end
