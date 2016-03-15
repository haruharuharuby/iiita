class Article < ActiveRecord::Base
  belongs_to :user
  has_many :article_tag_relations
  has_many :tags, through: :article_tag_relations
  has_many :stocks
  has_many :stocked_users, through: :stocks
  has_many :comments

  enum publication: { draft: 0, opened: 1 }

  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 10 }
  validates :body, presence: true, length: { minimum: 10 }

  attr_accessor :word_of_seeking

  scope :public_article, -> { where publication: :opened }

end
