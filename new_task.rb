module TaskWriter

  def self.write(filename, task)
    CSV.open(filename, "a+") do |csv|
      csv << [task]
    end
  end

end
