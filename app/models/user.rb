class User < ActiveRecord::Base
  has_many :articles
  has_many :stocks
  has_many :stocked_articles, -> { Article.opened }, through: :stocks, source: :article
  has_many :tag_follows
  has_many :tags, through: :tag_follows

  has_many :follow_to, class_name: "UserFollow", foreign_key:"from_user_id"
  has_many :following, through: :follow_to, source: :to_user
  has_many :follow_from, class_name:"UserFollow", foreign_key:"to_user_id"
  has_many :followed, through: :follow_from, source: :from_user

  include Gravtastic
  gravtastic

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, uniqueness: true, presence: true, length: { minimum: 8,　maximum: 32 }

  def contribution
    self.followed.count + self.articles.count
  end

  def find_stock(article)
    self.stocks.find_by(article: article)
  end

  def find_follow_to(user)
    self.follow_to.find_by(to_user: user)
  end

  def tag_following?(tag)
    self.tag_follows.find_or_initialize_by(tag: tag)
  end

  def to_param
    name
  end
end
