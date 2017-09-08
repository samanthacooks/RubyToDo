require 'csv'
require 'pry'
require_relative 'task'
require_relative 'todo_list'
require_relative 'task_writer'


# today = ToDoList.new
# my_list = today.load_todo_list('todo_list_data.csv')

#  completed_task = TaskWriter.complete('todo_list_data.csv',"Sleep.")



# p my_list



if ARGV.any?

today = ToDoList.new
my_list = today.load_todo_list('todo_list_data.csv')



command = ARGV[0]
option = ARGV[1..-1]


case command
when "list"
  then
    listed = TaskWriter.pretty_list('todo_list_data.csv')
when "add"
  then
    new_task = ARGV[1]
    adding_task = TaskWriter.write('todo_list_data.csv', new_task)

    puts "Appended #{new_task} to the list."
when "remove"
  then
    delete_task = ARGV[1]
    deleting_task = TaskWriter.delete('todo_list_data.csv', delete_task)

  puts "Removed #{delete_task} from the list."
when "complete"
  then
    completed = ARGV[1]
    completed_task = TaskWriter.complete('todo_list_data.csv',completed)

  puts "Marked #{completed} as complete."
  else
    puts "I don't know."
  end
end

