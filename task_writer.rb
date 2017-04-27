module TaskWriter

  def self.write(filename, task)
    CSV.open(filename, "a+") do |csv|
      csv << [task]
    end
  end

  def self.pretty_list(filename)
    data = CSV.table(filename)
    data.each do |task|
      if task[:complete] == "complete"
        p "[X] #{task[:item_description]}"
      elsif
        p "[ ] #{task[:item_description]}"
      end
    end

    File.open(filename, "w") do |new_csv|
      new_csv.write(data.to_csv)
    end
  end

  def self.delete(filename, task)
    data = CSV.table(filename)
    data.delete_if do |row|
        row[:item_description].include?(task)
    end

    File.open(filename, "w") do |new_csv|
      new_csv.write(data.to_csv)
    end
  end

  def self.complete(filename,task)
    data = CSV.table(filename)
    data.each do |row|
      if row[:item_description] == task
        binding.pry
        row[:complete] == "complete"
      else
      end
    end

    File.open(filename, "w") do |new_csv|
      new_csv.write(data.to_csv)
    end
    self.pretty_list(filename)
  end

end
