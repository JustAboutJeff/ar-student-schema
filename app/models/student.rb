require_relative '../../db/config'

class Student < ActiveRecord::Base
  validates_format_of :email, :with => /.+@+.+[\.]+..+/
  validates_uniqueness_of :email
  validates_numericality_of :age, :greater_than_or_equal_to => 5
  validates_format_of :phone, :with => /^[()0-9\-\+\sx]+/
  validates_length_of :phone, :minimum => 10

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def age
    @age = Date.today.year - self.birthday.year - ((Date.today.month > self.birthday.month || (Date.today.month == self.birthday.month && Date.today.day >= self.birthday.day)) ? 0 : 1 )
  end
end
