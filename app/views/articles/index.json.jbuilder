json.array!(@articles) do |article|
  json.extract! article, :id, :source, :description
  json.url article_url(article, format: :json)
end
