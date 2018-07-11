module CLI

  def greeting
    puts "Hello and welcome to your daily dose of news"
    puts "What is your name?"
    get_name
  end

  def ask_time
    puts "How much free time do you have to read on a daily basis? (in minutes)"
    get_available_time
  end

  def categories
    ["Business", "Entertainment", "Health", "Science", "Sports", "Technology"]
  end

  def put_category_list
    categories.each do |category|
      puts "#{categories.index(category)+1}) #{category}"
    end
  end

  def ask_categories
    puts "Select your interests out of the following"
    put_category_list
    puts "Enter the number corresponding to your
    selection - type 'done' when finished."
    get_interests
  end

  def run_cli
    greeting
    ask_time
    ask_categories
  end
end
