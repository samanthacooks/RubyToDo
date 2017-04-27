module TaskWriter

  def self.update_csv(filename,data)
    File.open(filename, "w") do |new_csv|
      new_csv.write(data.to_csv)
    end
  end

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
      else
        p "[ ] #{task[:item_description]}"
      end
    end

    self.update_csv(filename,data)
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
        row[:complete] == "complete"
      else
      end
    end
    self.update_csv(filename,data)
    self.pretty_list(filename)
  end

end
