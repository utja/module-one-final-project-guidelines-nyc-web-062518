module CLI

  def greeting
    puts "Hello and welcome to your daily dose of news"
    puts "What is your name?"
    get_name
  end

  def show_articles
    "Here are your personally curated list of articles for today:"
    Article.all.each do |article|
      puts "#{article.id} : #{article.title}"
    end
  end

  def select_favorites
    puts "Please select your favorites by number. Enter done when you have finished:"
    selection = nil
    until selection == "done"
      selection = STDIN.gets.chomp
      break if selection == "done"
      self.save_new_favorite(selection.to_i)
    end
  end

  def options
    puts "Is there anything else you would like to do today?"
    puts "Show me my favorites"
    puts "Delete a favorite"
    puts ""
  end

  def show_favorites
    puts "If you would like to see your favorites, type yes now:"
    selection = STDIN.gets.chomp
    if selection == "yes"
      puts self.favorites
    end
  end

  def delete_favorite
    puts "Would you like to delete a favorited article?:"
  end

  def run_cli
    greeting
    show_articles
    select_favorites
    show_favorites
  end

end
