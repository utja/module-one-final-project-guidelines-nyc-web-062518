class User < ActiveRecord::Base
  has_many :interests

  def get_interests
    selection = nil
    until selection == "done"
      selection = STDIN.gets.chomp
      break if selection == "done"
      self.interests << Interest.all[selection.to_i - 1]
    end
  end

  def interest_names
    self.interests.map do |interest|
      interest.name
    end
  end

end
