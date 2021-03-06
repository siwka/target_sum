class Array
  def read_prices
    self.uniq.map!{ |a| a.delete('.').to_i }.reverse! - [0]
  end

  def reject_expensive(value)
    self.select! { |a| a < value }
    self
  end

  def each_less(limits_arr)
    !self.zip(limits_arr).map {|a,b| a<=b}.include?(false)
  end

  def reject_each_more_than(limits_arr)
    self.select! { |arr| arr.each_less(limits_arr) }
  end

  def divisors_of(target)
    # self.find_all { |a| target % a == 0 }
    qty, div = [], []
    self.each_with_index do |a,i|
      if target % a == 0
        qty << target / a
        div << a
      end
    end
    [qty, div]
  end

  def calculate_limits(target, prices)
    for i in (0..prices.length-1) do
      self << (target / prices[i])
    end
    self
  end

  def check_subsets_for_sum(prices, target)
    results = []
    self.each do |a|  #check for arrays with different length - test
      tmp = a.zip(prices).map { |x,y| x*y } unless prices.nil?
      suma = tmp.reduce(:+) unless tmp.nil?
      results << a if suma == target
    end
    results
  end

  def match_prices_with_entrees(full_menu, prices)
    prices.to_money
    sample_meals = []
    for i in (0..self.length-1) do
      qty = self[i]
      selected_prices = qty.select_nonzero_indexes.select_result_prices(prices)
      qty -= [0]
      qty.validate_eq_length(selected_prices)
      selected_prices.validate_eq_length(qty)
      sample_meals << qty.match_with(full_menu, selected_prices)
    end
    sample_meals
  end

  def to_money
    self.map!{ |g| '%.2f' % (g.to_f/100) }
  end

  def select_nonzero_indexes
    self.each_index.select{ |i| self[i] != 0 }
  end

  def select_result_prices(prices)
    self.map{ |i| prices[i] } - [nil]
  end

  def combine(prices)
    self.slice(0, prices.length).zip(prices)
  end

  def match_with(full_menu, prices)
    selected_entrees = []
    prices.map do |a|
      selected_entrees << full_menu.select{|k,v| v == a }.keys
    end
    self.zip(selected_entrees, prices)
  end  

  def validate_eq_length(arr)
    self.slice!(0, arr.length) if self.length > arr.length
    self
  end

  def odd_values
    self.values_at(* self.each_index.select {|i| i.odd?})
  end

  def even_values
    self.values_at(* self.each_index.select {|i| i.even?})
  end

  def retireve_from(prices)
    result_prices = []
    self.each_with_index { |ind|  result_prices << prices[ind] }
    result_prices
  end
end