class Interest < ActiveRecord::Base
  belongs_to :user
  has_many :articles
  #calling articles

  def self.interests_names
    interests_instances = Interest.where("user_id == 1")
    interest_name_array = interests_instances.map do |instance|
      instance.name
    end
  end
  # => entertainment, business

  




  def get_articles
    news = News.new("d2c37d79b5c84debb698214093e9c9da")
    articles = interest_names.map do |interest|
        news.get_top_headlines(country: "us", language: "en", category: interest, pageSize: articles_per_interest)
      end
    articles.flatten[0..number_of_articles - 1]
  end

  def save_articles
    get_articles.each do |article|
      binding.pry
      Articles.create()
    end
  end



end
