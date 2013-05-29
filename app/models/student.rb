require_relative '../../db/config'
require 'ruby-units'

class Student < ActiveRecord::Base
  def name
    "#{self.first_name} #{self.last_name}"
  end

  def age
    (Time.now.year - self.birthday.year) - 1
  end
end
