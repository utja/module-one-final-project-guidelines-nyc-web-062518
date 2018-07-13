module CLI

  def greeting
    puts "================================================================================================================================="
    puts "Hello and welcome to your daily dose of news"
    puts "================================================================================================================================="
    puts "What is your name?"
    get_name
    puts "================================================================================================================================="
    puts "Welcome #{self.name}"
    puts "================================================================================================================================="
  end

  def article_message
    puts "Here are your personally curated list of articles for today:"
    puts "================================================================================================================================="
  end

  def show_articles
    Article.all.each do |article|
      puts "#{article.id} : #{article.title}"
    end
    puts "================================================================================================================================="
  end

  def select_message
    puts "Please select your favorites by number. Enter one number at a time. Enter 'done' when you have finished:"
    puts "================================================================================================================================="
  end

  def select_favorites
    selection = nil
    until selection == "done"
      selection = STDIN.gets.chomp
      puts "================================================================================================================================="
      break if selection == "done"
      self.save_new_favorite(selection.to_i)
      sleep(0.3)
      puts "#{selection} has been added to your favorites list"
      puts "Please select any more favorites by number. Enter 'done' when you have finished:"
      puts "================================================================================================================================="
    end
  end

  def last_message
    puts "Is there anything else you would like to do today? Enter the corresponding number to continue. Enter 'done' if you're done:"
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
        puts "================================================================================================================================="
        favorites_list
        puts "================================================================================================================================="
        sleep(0.1)
        last_message
      elsif selection == "2"
        puts "================================================================================================================================="
        favorites_list
        delete_a_favorite
        puts "================================================================================================================================="
        sleep(0.1)
        last_message
      elsif selection == "3"
        puts "================================================================================================================================="
        show_articles
        sleep(0.1)
        last_message
      elsif selection == "4"
        puts "================================================================================================================================="
        show_articles
        puts "Please select the number of the article you would like to add"
        select_favorites
        sleep(0.1)
        last_message
      elsif selection == "5"
        puts "================================================================================================================================="
        find_article_with_most_favorites
        puts "================================================================================================================================="
        sleep(1)
        last_message
      elsif selection == "6"
        puts "================================================================================================================================="
        sources
        puts "================================================================================================================================="
        sleep(1)
        last_message
      elsif selection == "7"
        puts "================================================================================================================================="
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
        puts "================================================================================================================================="
        sleep(1)
        last_message
      else
        puts "================================================================================================================================="
        puts "That's not a valid input! \nChoose from 1-7 or enter 'done'"
        puts "================================================================================================================================="
      end
    end
    puts "================================================================================================================================="
    puts "Thank you for using our app!"
  end

  def favorites_list
    self.favorites.each do |article_index|
      puts "#{article_index.article.id}: #{article_index.article.title}"
    end
  end

  def ask_if_favorite
    puts "If you would like to see your favorites, type 'yes' now. Type 'no' to continue."
    puts "================================================================================================================================="
    selection = STDIN.gets.chomp
    if selection == "yes"
      puts "================================================================================================================================="
      favorites_list
      puts "================================================================================================================================="
    end
  end

  def ask_if_delete_favorite
    puts "If you would like to remove an article from your favorites list, type 'yes' now. Type 'no' to continue."
    puts "================================================================================================================================="
    selection = STDIN.gets.chomp
    puts "================================================================================================================================="
    if selection == "yes"
      delete_a_favorite
      puts "================================================================================================================================="
      puts "Your selected articles have been removed from your favorites list."
      puts "================================================================================================================================="
    end
  end

  def delete_a_favorite
    selection = nil
    until selection == "done"
      puts "Enter the number of the article which you would like to remove. Type 'done' when you are finished:"
      puts "================================================================================================================================="
      selection = STDIN.gets.chomp
      break if selection == "done"
      self.delete_favorite(selection.to_i)
      puts "================================================================================================================================="
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
    article_message
    select_message
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
