require 'csv'
require 'pry'
require_relative 'task'
require_relative 'todo_list'



today = ToDoList.new
my_list = today.load_todo_list('todo_list_data.csv')


listed = my_list.each {|task| puts "- #{task.item_description}"}

