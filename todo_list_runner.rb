require 'csv'
require 'pry'
require_relative 'task'
require_relative 'todo_list'
require_relative 'new_task'


if ARGV.any?

today = ToDoList.new
my_list = today.load_todo_list('todo_list_data.csv')



command = ARGV[0]
option = ARGV[1..-1]


case command
when "list"
  then
    listed = my_list.each {|task| puts "- #{task.item_description}"}
when "add"
  then
    new_task = ARGV[1]
    adding_task = TaskWriter.write('todo_list_data.csv', new_task)

    puts "Appended #{new_task} to the list."
  else
    puts "I don't know."
  end
end

