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
end