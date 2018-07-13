# require_relative '../app/models/api/news.rb'
require_all 'app'


jon = User.create(name: "Jon")
kai = User.create(name: "Kai")
sean = User.create(name: "Sean")
tony = User.create(name: "Tony")

news = News.new("d2c37d79b5c84debb698214093e9c9da")
["Business", "Entertainment", "Health", "Science", "Sports", "Technology"]
articles = news.get_top_headlines(country: "us", language: "en", pageSize: 10).flatten

array_of_hashes = []
articles.each do |article|
  hash = {
    :title => article.title,
    :url => article.url,
    :source => article.name,
    :publishedAt => article.publishedAt,
    :author => article.author,
    :description => article.description
  }
  array_of_hashes << hash
end

array_of_hashes.each do |hash|
  Article.create(hash)
end

# jon.id = 1
jon.save_new_favorite(2)
jon.save_new_favorite(3)
jon.save_new_favorite(4)
jon.save_new_favorite(8)
jon.save_new_favorite(5)

#kai.id = 2
kai.save_new_favorite(6)
kai.save_new_favorite(5)
kai.save_new_favorite(1)
kai.save_new_favorite(2)

#sean.id =3
sean.save_new_favorite(3)
sean.save_new_favorite(5)
sean.save_new_favorite(1)
sean.save_new_favorite(6)

#tony.id = 4
tony.save_new_favorite(1)
tony.save_new_favorite(9)
tony.save_new_favorite(5)
tony.save_new_favorite(8)
tony.save_new_favorite(7)
