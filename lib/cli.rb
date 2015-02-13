require 'csv'

class Cli
  def arguments_any?	
    !ARGV.empty?
  end

  def read_csv_file
    @csv_to_a = []
    if arguments_any?
      read_csv_to_array  
    end
  end

  def read_csv_to_array
    CSV.foreach(ARGV.first, headers: false) do |row|
      @csv_to_a << row.map!{ |e| e.gsub(/[$]/,'') }
    end
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

  def all_choices?
    ARGV[1] == 'y' ? true : false 
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
    print "\nThere is no combination of dishes that will be equal in cost to the target price of $#{'%.02f' % target.fdiv(100)}"
    puts ARGV[1] == 'y' ? ".\n\n" : " for only one entree.\n\n"
  end 

  def announce_combination(target, results)
    puts ">>>>>>>>>> * <<<<<<<<<<<<"  	
    puts "\nFOR THE TARGET PRICE OF $#{'%.02f' % target.fdiv(100)}, CHOICES ARE:\n\n"
    display_results(results)
  end

  def display_results(results)
    results.each_with_index do |r,i|
      puts ">>>>>>>>>>>  #{i+1} - option  <<<<<<<<<<<<<"
      puts "\nQTY\tENTREE:\t\tPRICE\n\n"
      r.each do |s|
        print "#{s[0]}  #{s[1].join(', ')}\t$#{s[2]}\n\n" if s[1].kind_of?(Array)
      end
    end
    puts "==================================================="
  end  
end