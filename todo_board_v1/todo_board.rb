require "./list.rb"


class TodoBoard

  def initialize(label)
    @list = List.new(label)
  end

  def get_command
    puts "Please enter a command"
    command = gets.chomp

    case command
    when "mktodo"
      puts "Please enter a title for the list"
      title = gets.chomp
      puts "Please enter a due day in 'YYYY-MM-DD' format"
      date = gets.chomp
      puts "Please enter a description of the list. 'This is optional"
      description = gets.chomp
        if description == ""
         @list.add_item(title, date)
        else
          @list.add_item(title, date, description) 
        end
    when "up"
      puts "Please enter the index of the item you would like to move chose from 0 - #{@list.size - 1}"
      index_up = gets.chomp.to_i
      puts "Please enter the how many spaces you would like to move the item. 'This is optional'"
      amount_up = gets.chomp
        if amount_up == ""
          @list.up(index_up)
        else
          @list.up(index_up, amount_up.to_i)
        end
    when "down"
      puts "Please enter the index of the item you would like to move chose from 0 - #{@list.size - 1}"
      index_down = gets.chomp.to_i
      puts "Please enter the how many spaces you would like to move the item. 'This is optional'"
      amount_down = gets.chomp
        if amount_down == ""
          @list.down(index_down)
        else
          @list.down(index_down, amount_down.to_i)
        end
    when "swap"
      puts "Please enter the index of the first item you would like to move"
      index_1 = gets.chomp.to_i
      puts "Please enter the index of the first item you would like to move"
      index_2 = gets.chomp.to_i
      @list.swap(index_1, index_2)
    when "sort"
      puts "Your todo list is sorted by date"
      @list.sort_by_date!
    when "priority"
      puts "This is the top of your list #{@list.print_priority}"
    when "print"
      puts "Print the list, if you would like an item at a given index please enter it now. 'This is optional'"
      index = gets.chomp
        if index.empty?
          @list.print
          true
        else
          @list.print_full_item(index.to_i)
          true
        end
    when "quit"
      return false
    else
      puts "Sorry that isn't a valid input"
    end

  end

  def run
    while true
      return if !get_command
    end

  end


end