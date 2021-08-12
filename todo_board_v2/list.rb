require "./item.rb"

class List
  attr_accessor :label

  def initialize(label)
    @label = label
    @items = []
  end

  def add_item(title, deadline, description = "")
    return false if !Item.valid_date?(deadline)
    @items << Item.new(title, deadline, description)
    true
  end

  def size
    @items.length
  end

  def valid_index?(index)
    0 <= index && index < self.size
  end

  def swap(index_1, index_2)
    return false if !valid_index?(index_1) || !valid_index?(index_2)
    @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
  end

  def [](index)
    return nil if !valid_index?(index)
    @items[index]
  end

  def priority
    @items.first
  end

  def print
    puts "------------------------------"
    puts @label.upcase
    puts "------------------------------"
    puts "Index | Item                | Deadline | Complete"
    puts "------------------------------"

    count = 0
    while count < @items.length
      puts "#{count}     | #{@items[count].title.ljust(20)} |#{@items[count].deadline} | #{@items[count].done}"
      count += 1
    end

  end

  def print_full_item(index)
    puts "---------------------"
    puts "#{@items[index].title}           #{@items[index].deadline}"
    puts "#{@items[index].description}     #{@items[index].done}"
    puts "---------------------"
  end

  def print_priority
    print_full_item(0)
  end

  def up(index, amount = 1)
    return false if !valid_index?(index)

    while amount > 0 && index != 0
      swap(index, index - 1)

      index -= 1
      amount -= 1

    end
    true
  end

  def down(index, amount = 1)
    return false if !valid_index?(index)

    while amount > 0 && index != size - 1  
      swap(index, index + 1)

      index += 1
      amount -= 1

    end
    true
  end

  def sort_by_date!
    @items.sort_by! { |item| item.deadline }
  end

  def toggle_item(index)
    @items[index].toggle
  end

  def remove_item(index)
    return false if !valid_index?(index)
    @items = @items[0...index] + @items[index + 1..-1]
    true
  end

  def purge
    @items.delete_if(&:done)
  end

end