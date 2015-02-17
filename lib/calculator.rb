class Calculator

  def initialize
  end

  def possible_solution_exist?(prices, target)
    solvable = target.odd? ? false : true
    val = Array.new(prices.length, 1)
    prices.each_with_index do |p,i|
      if target.odd? && p.odd?
        val[i] = 2
        solvable = true
      end
      val[i] = 3 if target % 10 == p % 10
  end
    [val, solvable]
  end

  def is_odd?

  end

  def adjust_limits(limit_entree_qty, prices)
    limit = limit_entree_qty.max
    if (prices.length > 6 && limit > 6)
      limit = case prices.length
        when 7 then 7
        when 8 then 6
        when 9 then 5
        when 10, 11 then 3
        when 12, 13, 14 then 2
        else
          puts "\nCHOOSE SHORTER MENU!\n\n"
          exit(2)
      end
    end
    limit
  end

  def knapsack_no_repetition(target, prices, values)
    row = prices.length + 1
    col = target + 1
    knapsack = Array.new(row) { Array.new(col) }
    keepitem = Array.new(row) { Array.new(col, 0) }

    for item in (0..row-1) do
      knapsack[item][0] = 0
    end
    for weight in (0..col-1) do
      knapsack[0][weight] = 0
    end        

    for item in (1..row-1) do
      for weight in (1..col-1) do
        new_item = true
        if prices[item-1] <= weight
          knapsack[item][weight] = [knapsack[item-1][weight - prices[item-1]] + values[item-1], knapsack[item-1][weight]].max        
          new_item = false if knapsack[item-1][weight - prices[item-1]] + values[item-1] < knapsack[item-1][weight]
          # keepitem[item][weight] = new_item ? item : keepitem[item-1][weight]
          keepitem[item][weight] = new_item ? item : 0
        else
          knapsack[item][weight] = knapsack[item-1][weight]
          keepitem[item][weight] = keepitem[item-1][weight]
        end
      end
    end
    [knapsack, keepitem]
  end

  def retireve_solution_from(keepitem, target, prices)
    solutions = []
    weight = target
    row = prices.length + 1
    arr = (1..row-1).to_a.reverse
    arr.each do |idx|
      if keepitem[idx][weight] != 0
        solutions << idx-1
        weight -= prices[idx-1]
      end
    end
    solutions
  end
end