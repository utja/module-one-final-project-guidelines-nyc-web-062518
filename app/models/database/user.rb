class User < ActiveRecord::Base
  has_many :favorites
  has_many :articles, through: :favorites
  include CLI

  def get_name
    self.name = STDIN.gets.chomp
    self.save
  end

  def save_new_favorite(article_id)
    Favorite.create(article_id: article_id, user_id: self.id)
  end

  def delete_favorite(article_id)
    favorite_to_delete = (Favorite.where(user_id: self.id, article_id: article_id))
    favorites.destroy(favorite_to_delete)
  end

end
