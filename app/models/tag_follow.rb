class TagFollow < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag

  validates :tag_id, presence: true
  validates :user_id, presence: true

  # def self.update(user, tag_list)
  #   tag_list.each do |tag|
  #     tag_record = Tag.find(name: tag)
  #     TagFollow.create!(user, tag_record)
  #   end
  # end
end
