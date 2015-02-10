require 'calculator'
require 'array'

class Quest
attr_accessor :cli, :calculator, :prices, :target

  def initialize(cli)
  	@calculator = Calculator.new
  	@full_menu = {}
  	@prices = Array.new
    @cli = cli
  end

  def start
  	@cli.exit_with_error_message unless @cli.arguments_any?
  	@cli.read_csv_file
  	@target = @cli.read_target
  	@cli.announce_bad_target if @target == 0 # add_options prices vs total, etc
  	@full_menu = @cli.read_full_menu
  	@prices = @full_menu.values.read_prices.reject_expensive(@target)
  end

  def run
  	unless @prices.nil? || @prices.empty?
  		arr_size = @prices.length
  	  limit_entree_qty = []
	    for i in (0..arr_size-1) do
				limit_entree_qty << (@target / @prices[i])
			end
	  	max_qty = limit_entree_qty.max

			perm = (0..max_qty).to_a.repeated_permutation(arr_size).to_a
			perm.reject_each_more_than(limit_entree_qty)

			perm.check_subset_sum(@prices, @target)
  	end
  end

	def finish
		if calculator.wrong_data?
			cli.announce_bad_data#()
		elsif !calculator.combination_any?
			cli.announce_no_combination(@target)
		else
			cli.announce_combination(@target, menus)
		end
	end 
end