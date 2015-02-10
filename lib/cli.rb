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
	end

	def read_target
		target = @csv_to_a.shift.join('').delete('.').to_i
	end

	def read_full_menu
		full_menu = Hash[*@csv_to_a.flatten].sort_by {|k, v| v}.to_h
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

  def display_machine_thinking
    puts "Machine is thinking if there is menu combination..."
  end

	def announce_no_combination(target)
		puts "\nThere is no combination of dishes that will be equal in cost to the target price of $#{sprintf('%.02f',target)}.\n\n"
	end  

  def announce_combination(target, menus)
  	puts "\nFor target price of $#{sprintf('%.02f',target)} there are following menus of dishes:\n\n"
  	puts "#{menus}"
  end
end