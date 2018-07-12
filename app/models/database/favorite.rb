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


      hash = {}
       Listing.all.map do |listing|
         hash[listing] = listing.trips.count
       end
       Listing.all.sort_by do |listing|
         listing.trips.count
       end.reverse.first
       hash
       hash.max_by do |k,v|
         v
       end

   def self.sorted
     sorted_array = find_count_of_article_and_favorite_count.sort_by do |key, value|
       value
     end
     sorted_array.reverse.first
     #article id, count
   end

   def self.find_article_with_most_favorites
     most_fav_article_id = sorted[0]
     Article.where(id: most_fav_article_id).first
   end

   def self.find_source_of_article_with_most_favorites
     find_article_with_most_favorites.source
   end







 end


#    def score( array )
#   hash = Hash.new(0)
#   array.each{|key| hash[key] += 1}
#   hash
# end
