class Item

  def self.valid_date?(date_string)
    month = (1..12).to_a
    dates = (1..31).to_a
    date_split = date_string.split('-').map(&:to_i)
    return false if !month.include?(date_split[1]) 
    return false if !dates.include?(date_split[2])
    true
  end

  attr_reader :done
  attr_accessor :title, :deadline, :description

  def initialize(title, deadline, description)
    raise "Deadline is not a valid date" if !Item.valid_date?(deadline)
    @title = title
    @deadline = deadline
    @description = description
    @done = false
  end

  def toggle
    if @done == false
      @done = true
    else
      @done = false
    end
  end

end