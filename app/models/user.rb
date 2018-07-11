class User < ActiveRecord::Base
  has_many :interests

  def get_interests
    puts "hello"
    # if user.interests
    #
    # else
    #
    # end
  end

  def save_interests
  end


end
