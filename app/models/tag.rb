class Tag < ActiveRecord::Base
  has_many :article_tag_relations
  has_many :articles, through: :article_tag_relations
  has_many :tag_follows
  has_many :followers, through: :tag_follows, source: :user

  validates :name, uniqueness: true, length: { maximum: 16 }

  def follow?(user)
    self.tag_follows.exists? user: user
  end

  def to_param
    name
  end
end
