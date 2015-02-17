require 'calculator'
require 'array'

class Quest
attr_accessor :cli, :calculator, :full_menu, :target, :prices, :values

  def initialize(cli)
    @full_menu = {}
    @prices, @values, @results = Array.new
    @calculator = Calculator.new
    @cli = cli
  end

  def start
    cli.exit_with_error_message unless @cli.arguments_any?
    cli.read_csv_file
    @target = @cli.read_target
    cli.announce_bad_target if @target <= 0 # add_options prices vs total, etc
    @full_menu = @cli.read_menu
    @prices = @full_menu.values.read_prices.reject_expensive(@target)
    @values, solvable = @calculator.possible_solution_exist?(@prices, @target) unless @prices.empty?
    @prices = [] unless solvable
    @prices.empty?
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

  def run_knapsack
    # knapsack works as expected but probably my application to the exercise has resoning nadequacies
    # @values = Array.new(@prices.length, 1) # does not support receiving closest total value to target
    # @prices.shuffle!   # run_knapsack results vary on array elements ordered differently
    knapsack, keepitem = @calculator.knapsack_no_repetition(@target, @prices, @values)
    result_items = @calculator.retireve_solution_from(keepitem, @target, @prices)
    selected_prices = result_items.retireve_from(@prices)

    # puts "\nprices------\n"
    # print @prices
    # puts "\ntotal------\n"
    # print @prices.reduce(:+)
    # puts "\n========\n"
    # print result_items
    # puts "\nselected prices------\n"
    # print selected_prices
    # puts "\ntotal------\n"
    # puts selected_prices.reduce(:+)

    if selected_prices.reduce(:+) == @target
      @results = Array.new(selected_prices.length,1).match_with(@full_menu, selected_prices.to_money)
    else
      @results = []
    end
    # puts "\n********************\n"
    # puts @target
    # print @results
    # puts "\n********************\n"
    @results
  end

  def finish
    if @results.empty?
      cli.announce_no_combination(@target)
    else
      cli.announce_combination(@target, @results)
    end
  end
end