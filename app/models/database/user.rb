class User < ActiveRecord::Base
  has_many :favorites
  has_many :articles, through: :favorites
  include CLI

  def get_name
    self.name = STDIN.gets.chomp
    self.save
  end

  def save_new_favorite(article_id)
    # Favorite.create(article_id: article_id, user_id: self.id)
    self.favorites << Favorite.new(article_id: article_id, user_id: self.id)
  end

  def delete_favorite(article_id)
    favorite_to_delete = (Favorite.where(user_id: self.id, article_id: article_id))
    favorites.destroy(favorite_to_delete)
  end

  def find_article_with_most_favorites
    most_fav_article_id = sorted[0]
    most = Article.where(id: most_fav_article_id).first
    puts "1: #{most.title}
         #{most.url}"
  end

  def find_source_of_article_with_most_favorites
    favorites.articles
  end

end
