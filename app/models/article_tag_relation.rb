class ArticleTagRelation < ActiveRecord::Base
  belongs_to :tag, counter_cache: :articles_count
  belongs_to :article

  validates :tag_id, presence: true
  validates :article_id, presence: true

end
