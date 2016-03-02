class ArticleTagging
  def initialize(article)
    @article = article
  end

  def register
    ActiveRecord::Base.transaction do
      @article.save
      new_tag_names = @article.tag_list.split(",")
      @article.tags.each do |tag|
        rel = @article.article_tag_relations.find_by(tag: tag) unless new_tag_names.include?(tag.name)
        rel.destroy! if rel
      end

      new_tag_names.each do |tag_name|
        tag = Tag.find_or_create_by(name: tag_name)
        @article.article_tag_relations.find_or_create_by(tag: tag)
      end
    end
  end
end
