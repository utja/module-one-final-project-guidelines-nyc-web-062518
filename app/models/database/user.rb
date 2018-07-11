class User < ActiveRecord::Base
  has_many :interests
  include CLI

  def get_name
    self.name = STDIN.gets.chomp
    self.save
  end

  def get_available_time
    available_time = STDIN.gets.chomp
    self.time = available_time.to_i
    self.save
  end

  def get_interests
    selection = nil
    until selection == "done"
      # if selection != 1..7 || selection == "done"
      selection = STDIN.gets.chomp
      break if selection == "done"
      self.interests << Interest.all[selection.to_i - 1]
    end
  end

  def interest_names
    self.interests.map do |interest|
      interest.name
    end
  end

  def get_articles
    news = News.new("d2c37d79b5c84debb698214093e9c9da")
    # news.get_sources(country: 'us', language: 'en')
    articles = interest_names.map do |interest|
        news.get_top_headlines(country: "us", language: "en", category: interest, pageSize: articles_per_interest)
      end
    articles.flatten[0..number_of_articles - 1]
  end

  def number_of_articles
    self.time / 5
  end

  def articles_per_interest
    (number_of_articles.to_f / self.interests.length).ceil
  end

  def results
    array_of_hashes = []
    get_articles.each do |article|
      hash = {
        :title => article.title,
        :url => article.url,
        :source => article.name
      }
      array_of_hashes << hash
    end
    array_of_hashes
  end

  def details
    results.each do |hash|
      hash.each do |key, value|
        puts value
      end
    end
  end
end
