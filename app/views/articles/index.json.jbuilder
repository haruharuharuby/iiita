json.array!(@articles) do |article|
  json.extract! article, :id, :title, :body, :user_id, :publication, :draft
  json.url article_url(article, format: :json)
end
