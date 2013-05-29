require_relative '../../db/config'
# require 'ruby-units'

class Student < ActiveRecord::Base
  validates :email, :uniqueness => true, :format => { :with => /\w+@\w+.\w\w+/}
  validate :age_greater_than_five
  validates :phone, :format => { :with => /\d{3}.+\d{3}.+\d{4,}/ }

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def age_greater_than_five
    if age < 5
      errors.add(:birthday, "Gotta be 5 to party")
    end
  end

  def age
    (Time.now.year - self.birthday.year) - 1
    # Unit('year').since(self.birthday)
  end
end
