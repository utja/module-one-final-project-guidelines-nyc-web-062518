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

  def most_favorited_source
    self.favorites.articles
   "will iterate over favorites, and find the highest source count"
   source_count = {

   }
 end
  #
  #
  #  Favorite.map do |article|
  #    if source_count.has_key? article.
  #      source_count[]
  #
  #      hash = {}
  #        array.map do |num|
  #          if hash.has_key? num
  #            hash[num] += 1
  #          else
  #            hash[num] = 1
  #          end
  #        end
  #        array
  #
  # end


end
