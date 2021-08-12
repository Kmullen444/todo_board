require "./list.rb"


class TodoBoard

  def initialize
    @list = {}
  end

  def get_command
    puts "Please enter a command"
    command,title = gets.chomp.split(" ")

    case command
    when "mklist"
      @list[title] = List.new(title)
    when "ls"
      @list.keys.each { |item| puts item }
    when "showall"
      @list.values.each { |item| item.print}
    when "mktodo"
      puts "Please enter an item for the list"
      item = gets.chomp
      puts "Please enter a due day in 'YYYY-MM-DD' format"
      date = gets.chomp
      puts "Please enter a description of the list. 'This is optional'"
      description = gets.chomp
        if description == ""
         @list[title].add_item(item, date)
        else
          @list[title].add_item(item, date, description) 
        end
    when "up"
      puts "Please enter the index of the item you would like to move chose from 0 - #{@list.size - 1}"
      index_up = gets.chomp.to_i
      puts "Please enter the how many spaces you would like to move the item. 'This is optional'"
      amount_up = gets.chomp
        if amount_up == ""
          @list[title].up(index_up)
        else
          @list[title].up(index_up, amount_up.to_i)
        end
    when "down"
      puts "Please enter the index of the item you would like to move chose from 0 - #{@list.size - 1}"
      index_down = gets.chomp.to_i
      puts "Please enter the how many spaces you would like to move the item. 'This is optional'"
      amount_down = gets.chomp
        if amount_down == ""
          @list[title].down(index_down)
        else
          @list[title].down(index_down, amount_down.to_i)
        end
    when "swap"
      puts "Please enter the index of the first item you would like to move"
      index_1 = gets.chomp.to_i
      puts "Please enter the index of the first item you would like to move"
      index_2 = gets.chomp.to_i
      @list[title].swap(index_1, index_2)
    when "sort"
      puts "Your todo list is sorted by date"
      @list.sort_by_date!
    when "priority"
      puts "This is the top of your list #{@list.print_priority}"
    when "print"
      puts "Print the list, if you would like an item at a given index please enter it now. 'This is optional'"
      index = gets.chomp
        if index.empty?
          @list[title].print
          true
        else
          @list[title].print_full_item(index.to_i)
          true
        end
    when "done"
      puts "Please enter the index of the item that is done"
      @list[title].toggle_item(gets.chomp.to_i) 
    when "remove"
      puts "Please enter the index fo the item to be deleted"
      @list[title].remove_item(gets.chomp.to_i)
    when "purge"
      @list[title].purge
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


board = TodoBoard.new
board.run