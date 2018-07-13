require_relative '../config/environment'
ActiveRecord::Base.logger.level = 1

user = User.create
user.run_cli
