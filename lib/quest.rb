require 'calculator'
require 'array'

class Quest
attr_accessor :cli, :calculator, :full_menu, :target, :prices

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
  	cli.announce_bad_target if @target <= 0 # add_options prices vs total, etc
  	@full_menu = @cli.read_menu
  	@prices = @full_menu.values.read_prices.reject_expensive(@target)
    # check_if_solution_night exist
    @prices.nil? || @prices.empty?
  end

  def run_boring_menu
    boring_menu = @prices.divisors_of(@target)
    @results = []
    unless boring_menu.nil? || boring_menu[0].empty?
      boring_menu[1].to_money
      @results << boring_menu[0].match_with(@full_menu, boring_menu[1])
    end
  end

  def run_permutation
    return unless cli.all_choices?
    limit_entree_qty = []
    # @calculator.adjust_limits?(@prices, @target)            
    limit_entree_qty.calculate_limits(@target, @prices)
    max_qty = Calculator.new
    numers_range_for_choice = max_qty.adjust_limits(limit_entree_qty, @prices)
    cli.statistics(@full_menu, @target, numers_range_for_choice)
    cli.display_machine_thinking
    perm = (0..numers_range_for_choice).to_a.repeated_permutation(@prices.length).to_a
    cli.display_nr_of_combinations(perm.count)
    perm.reject_each_more_than(limit_entree_qty)
    prices_subsets = perm.check_subsets_for_sum(@prices, @target)
    @results = prices_subsets.match_prices_with_entrees(@full_menu, @prices)
  end

	def finish
		if @results.empty?
			cli.announce_no_combination(@target)
		else
			cli.announce_combination(@target, @results)
		end
	end
end