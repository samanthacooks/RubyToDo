require_relative 'task'

class ToDoList

  def initialize
    @todo_list = []
  end

  def load_todo_list(filename)
    CSV.foreach(filename, :headers => true, :header_converters => :symbol) do |row|
      @todo_list << Task.new(row.to_hash)
    end
    @todo_list
  end

end
