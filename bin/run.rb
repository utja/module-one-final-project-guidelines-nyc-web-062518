require_relative '../config/environment'

app = CLI.new

app.get_name

user = User.create(name: app.user_name)
# binding.pry
app.display_categories
# binding.pry
user.get_interests
get_articles(user)
binding.pry
0
