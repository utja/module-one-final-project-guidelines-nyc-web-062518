class CLI

  attr_accessor :user_name

  def initialize
    puts "Hello and welcome to your daily dose of news"
  end

  def get_name
    puts "What is your name?"
    @user_name = STDIN.gets.chomp
  end

  def categories
    ["Business", "Entertainment", "General", "Health", "Science", "Sports", "Technology"]
  end

  def put_category_list
    categories.each do |category|
      puts "#{categories.index(category)+1}) #{category}"
    end
  end


  def display_categories
    puts "Select your interests out of the following"
    put_category_list
    puts "Enter the number corresponding to your
    selection - type 'done' when finished."
  end

  def get_interests

  end

end
