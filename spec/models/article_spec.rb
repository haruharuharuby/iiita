require 'rails_helper'

RSpec.describe Article, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it "save with tags associated itself" do
    user_for_test = User.create(name:"test-user", email:"test-user@iiita.com", password:"test-user")
    article = user.article.build(title: "This is a article for testing.", body: "This is a article for testing")
    article.tag_list = "1,2,3"
    article.save
  end
  it "invalid with title length less than 1 and over than 32"
  it "invalid with body length less than 5 and over than 8000"
end
