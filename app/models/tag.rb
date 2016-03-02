class Tag < ActiveRecord::Base
  has_many :article_tag_relations
  has_many :articles, through: :article_tag_relations
  has_many :tag_follows
  has_many :followers, through: :tag_follows, source: :user

  validates :name, uniqueness: true, length: { maximum: 16 }

  
end
