class Article < ActiveRecord::Base
  belongs_to :user
  has_many :article_tag_relations
  has_many :tags, through: :article_tag_relations

  enum publication: { draft: 0, opened: 1 }

  after_save :update_tags

  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 10 }
  validates :body, presence: true, length: { minimum: 10 }

  attr_accessor :word_of_seeking

  scope :public_article, -> { where publication: :opened }

  private
    def update_tags
      new_tag_names = self.tag_list.split(",")
      self.tags.each do |tag|
        rel = self.article_tag_relations.find_by(tag: tag) unless new_tag_names.include?(tag.name)
        rel.destroy! if rel
      end

      new_tag_names.each do |tag_name|
        tag = Tag.find_or_create_by(name: tag_name)
        self.article_tag_relations.find_or_create_by(tag: tag)
      end
    end
end
