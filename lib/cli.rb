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
      sleep(0.3)
      show_articles
      puts "Please select any more favorites by number. Enter done when you have finished:"
    end
  end

  def last_message
    puts "Is there anything else you would like to do today?, click the corresponding number to continue, enter done if you're done:"
    puts "1. Show me my favorites"
    puts "2. Delete a favorite"
    puts "3. Show me today's articles again"
    puts "4. Add another favorite"
    puts "5. See the most trending article today"
    puts "6. See the sources for the available articles"
    puts "7. See other users who marked some of their favorites"
  end

  def anything_else?
    last_message
    selection = nil
    until selection == "done"
      selection = STDIN.gets.chomp
      break if selection == "done"
      if selection == "1"
        favorites_list
        sleep(0.1)
        last_message
      elsif selection == "2"
        delete_a_favorite
        sleep(0.1)
        last_message
      elsif selection == "3"
        show_articles
        sleep(0.1)
        last_message
      elsif selection == "4"
        show_articles
        select_favorites
        sleep(0.1)
        last_message
      elsif selection == "5"
        find_article_with_most_favorites
        sleep(0.1)
        last_message
      elsif selection == "6"
        sources
        sleep(1)
        last_message
      elsif selection == "7"
        puts "Sorry, you are not the single source of truth"
        sleep(2)
        puts "You could be, but then you wouldn't be requesting that"
        sleep(2)
        puts "For requesting that, your computer will self destruct in..."
        sleep(1)
        n = 5
        while n > 0 do
          puts n
          sleep(1)
          n -= 1
        end
        puts "Just kidding."
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
    puts "If you would like to see your favorites, type 'yes' now. Type 'no' to continue."
    selection = STDIN.gets.chomp
    if selection == "yes"
      favorites_list
    end
  end

  def ask_if_delete_favorite
    puts "If you would like to delete an article, type 'yes' now. Type 'no' to continue."
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
      favorites_list
    end
  end

  def find_count_of_favorites_per_article
    Favorite.all.map do |favorite|
      favorite.article_id
    end
  end

  def find_count_of_article_and_favorite_count
    hash = Hash.new(0)
    find_count_of_favorites_per_article.each {|key| hash[key] += 1}
    hash
  end

  def sorted
    sorted_array = find_count_of_article_and_favorite_count.sort_by do |key, value|
      value
    end
    sorted_array.reverse.first
    #article id, count
  end

  def sources
    array_of_sources = Article.all.map do |article|
      "#{article.id}: #{article.source}"
    end
    puts array_of_sources
  end

  def run_cli
    greeting
    sleep(0.5)
    show_articles
    select_favorites
    sleep(0.5)
    ask_if_favorite
    sleep(0.5)
    ask_if_delete_favorite
    sleep(0.5)
    anything_else?
  end
end
