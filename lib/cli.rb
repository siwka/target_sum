require 'csv'

class Cli
  def arguments_any?	
    !ARGV.empty?
  end

  def read_csv_file
    @csv_to_a = []
    CSV.foreach(ARGV.first, headers: false) do |row|
      @csv_to_a << row.map!{ |e| e.gsub(/[$]/,'') }
    end
    # @csv_to_a
  end

  def read_target
    target = @csv_to_a.shift.join('').delete('.').to_i
  end

  def read_menu
    full_menu = Hash[*@csv_to_a.flatten].sort_by {|k, v| v}.to_h
  end

  def display_menu(menu)
    menu.each {|k,v| puts "#{k}\t\t$#{sprintf('%.02f',v)}" }
  end

  def error_message_on_exit
    puts "\nYou forgot to add file name to command. Try again!\n\n"
  end

  def exit_with_error_message
    error_message_on_exit
    exit(2)
  end

  def announce_bad_target
    puts "\nBad data in file. Try another file.\n\n"
  end

  def statistics(menu, target_price, max_qty)
    puts 
    display_menu(menu)
    puts
    puts "Your Target Price is: $#{'%.02f' % target_price.fdiv(100)}"
    puts "Limit of quantities for the same dish = #{max_qty}"
    puts "Number of Entrees to chose from: #{menu.length}\n\n"
  end

  def display_machine_thinking
    puts "==================================================="
    puts "Machine is thinking ..."
    puts "==================================================="
  end

  def display_nr_of_combinations(count)
    puts "\n\nNumber of possible dish combinations: #{count}."
    puts "Removing options that don't need to be considered.\n\n"
  end

  def announce_no_combination(target)
    puts "\nThere is no combination of dishes that will be equal in cost to the target price of $#{'%.02f' % target.fdiv(100)}.\n\n"
  end  

  def announce_combination(target, results)
    puts "\nFor target price of $#{'%.02f' % target.fdiv(100)} there are following menus of dishes:\n\n"
     puts "#{results}"
  end
end