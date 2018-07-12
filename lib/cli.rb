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

  def last_message
    puts "Is there anything else you would like to do today?, click the corresponding number to continue, enter done if you're done:"
    puts "1. Show me my favorites"
    puts "2. Delete a favorite"
    puts "3. Show me todays articles again"
    puts "4. I want to add another favorite"
  end

  def anything_else?
    last_message
    selection = nil
    until selection == "done"
      selection = STDIN.gets.chomp
      break if selection == "done"
      if selection == "1"
        favorites_list
        binding.pry
        last_message
      elsif selection == "2"
        delete_a_favorite
        last_message
      elsif selection == "3"
        show_articles
        last_message
      elsif selection == "4"
        show_articles
        select_favorites
        last_message
      else
        puts "that's not a valid input!"
      end
    end
    puts "Thank you for using our app!"
  end

  def favorites_list
    self.favorites.each do |article_index|
      puts "#{article_index.article.id}: #{article_index.article.title}"
    end
  end

  def ask_if_favorite
    puts "If you would like to see your favorites, type yes now:"
    selection = STDIN.gets.chomp
    if selection == "yes"
      favorites_list
    end
  end

  def ask_if_delete_favorite
    puts "If you would like to delete an article, type yes now:"
    selection = STDIN.gets.chomp
    if selection == "yes"
      delete_a_favorite
      puts "Your selected articles have been deleted."
    end
  end

  def delete_a_favorite
    selection = nil
    until selection == "done"
      puts "Enter the number of the article which you would like to delete. Type done when you are finished:"
      selection = STDIN.gets.chomp
      break if selection == "done"
      self.delete_favorite(selection.to_i)
    end
  end


  def run_cli
    greeting
    show_articles
    select_favorites
    ask_if_favorite
    ask_if_delete_favorite
    anything_else?
  end

end
