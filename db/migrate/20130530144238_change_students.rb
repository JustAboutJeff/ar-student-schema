require_relative '../config'

class ChangeStudents < ActiveRecord::Migration
  def up
    add_column :students, :name, :string
    add_column :students, :address, :string
    Student.all.each do |student|
      student.name = "#{student.first_name} #{student.last_name}"
      student.save
    end 
    remove_column :students, :first_name
    remove_column :students, :last_name
  end

  def down
    add_column :students, :last_name, :string
    add_column :students, :first_name, :string
    Student.all.each do |student|
      student.first_name, student.last_name = student.name.split(" ",2)
      student.save
    end
    remove_column :students, :name
    remove_column :students, :address
  end
end
  
# 20130530144238

