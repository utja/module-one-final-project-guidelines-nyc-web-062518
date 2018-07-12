class Favorite < ActiveRecord::Base
   belongs_to :user
   belongs_to :article

   def self.find_count_of_favorites_per_article
     Favorite.all.map do |favorite|
       favorite.article_id
     end
   end

   def self.find_count_of_article_and_favorite_count
     hash = Hash.new(0)
     Favorite.find_count_of_favorites_per_article.each {|key| hash[key] += 1}
     hash
   end

   def self.find_article_with_most_favorites
     sort = find_count_of_article_and_favorite_count.sort_by do |k => v|
       v
     end
     sort.reverse.first
   end
 end


#    def score( array )
#   hash = Hash.new(0)
#   array.each{|key| hash[key] += 1}
#   hash
# end
