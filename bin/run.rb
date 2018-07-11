require_relative '../config/environment'

app = CLI.new

app.get_name

user = User.new(name: app.user_name)
binding.pry
app.display_categories

user.get_interests
# binding.pry
0
