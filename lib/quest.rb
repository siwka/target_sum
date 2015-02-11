require 'calculator'
require 'array'

class Quest
attr_accessor :cli, :calculator#, :prices, :target siwka

  def initialize(cli)
  	@calculator = Calculator.new
  	@full_menu = {}
  	@prices = Array.new
    @cli = cli
  end

  def start
  	cli.exit_with_error_message unless @cli.arguments_any?
  	cli.read_csv_file
  	@target = @cli.read_target
  	cli.announce_bad_target if @target == 0 # add_options prices vs total, etc
  	@full_menu = @cli.read_menu
  	@prices = @full_menu.values.read_prices.reject_expensive(@target)
  end

  def run
  	unless @prices.nil? || @prices.empty?
      # temp limitations & to refactor ---->            
  		nr_of_prices = @prices.length
  	  limit_entree_qty = []
	    for i in (0..nr_of_prices-1) do
				limit_entree_qty << (@target / @prices[i])
			end
	  	max_qty = limit_entree_qty.max

      if (nr_of_prices > 6 && max_qty > 6)
        max_qty = case nr_of_prices
          when 7 then 7
          when 8 then 6
          when 9 then 5
          when 10, 11 then 3
          when 12 then 4
          when 13, 14 then 2
          else
            puts "\nCHOOSE SHORTER MENU!\n\n"
            exit(2)
        end
      end	
      # ------------------------------------>
  		cli.statistics(@full_menu, @target, max_qty)
      cli.display_machine_thinking

			perm = (0..max_qty).to_a.repeated_permutation(nr_of_prices).to_a
      cli.display_nr_of_combinations(perm.count)
			perm.reject_each_more_than(limit_entree_qty)
			@results = perm.check_subsets_for_sum(@prices, @target)
  	end
  end

	def finish
		if @results.empty?
			cli.announce_no_combination(@target)
		else
			cli.announce_combination(@target, @results)
		end
	end
end