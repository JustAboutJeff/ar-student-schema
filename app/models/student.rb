require_relative '../../db/config'
require 'time'
require 'date'

class Student < ActiveRecord::Base
  def name
    "#{self.first_name} #{self.last_name}"
  end

  def age
    d = self.birthday
    t = Time.now
    today_convert - birth_convert
  end
end
