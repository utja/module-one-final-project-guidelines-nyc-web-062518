def get_articles(user)
  interests = user.interest_names
  news = News.new("d2c37d79b5c84debb698214093e9c9da")
  news.get_sources(country: 'us', language: 'en')
  articles = interests.map do |interest|
      news.get_top_headlines(country: "us", language: "en", category: interest, pageSize: "1")
    end
end

def user_result(user)
  array_of_articles = get_articles(user).flatten
  array_of_hashes = []
  array_of_articles.each do |article|
    hash = {
      :title => article.title,
      :url => article.url,
      :source => article.name
    }
    array_of_hashes << hash
  end
  array_of_hashes
end


# x = n.get_everything(q: "apple", sortBy: "popularity")
#
# n.get_top_headlines(sources: "bbc-news")
#
# n.get_top_headlines(country: 'us', language: 'en', category: 'business')
#
# n.get_top_headlines(country: 'us', language: 'en', category: 'business', pageSize: '5')
#
# array = interests.map do |interest|
#   x = n.get_everything(language: 'en', q: interest, sortBy: 'relevancy', pageSize: '100', sources: 'google-news')
#     y = x.select do |article|
#     article.title.include?(interest)
#     end
# end
