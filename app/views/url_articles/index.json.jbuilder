json.array!(@url_articles) do |url_article|
  json.extract! url_article, :id, :source
  json.url url_article_url(url_article, format: :json)
end
