require 'calculator'
require 'array'

class Quest
attr_accessor :cli

  def initialize(cli)
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
      limit_entree_qty = []
      limit_entree_qty.calculate_limits(@target, @prices)
      max_qty = Calculator.new
      numers_range_for_choice = max_qty.adjust_limits(limit_entree_qty, @prices)
  		cli.statistics(@full_menu, @target, numers_range_for_choice)
      cli.display_machine_thinking
			perm = (0..numers_range_for_choice).to_a.repeated_permutation(@prices.length).to_a
      cli.display_nr_of_combinations(perm.count)
			perm.reject_each_more_than(limit_entree_qty)
			@results = perm.check_subsets_for_sum(@prices, @target)
  	end
  end

	def finish
		if @results.empty?
			cli.announce_no_combination(@target)
		else
      cos = @results.match_prices_with_entrees(@full_menu, @prices)
			cli.announce_combination(@target, cos)
		end
	end
end