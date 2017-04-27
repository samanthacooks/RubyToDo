require 'pry'
module TaskWriter

  def self.write(filename, task)
    CSV.open(filename, "a+") do |csv|
      csv << [task]
    end
  end

  def self.delete(filename, task)
    # binding.pry
    CSV.open(filename) do |out|
      if csv.include?(task)
        csv.delete(task)
      end
    end
  end

end
