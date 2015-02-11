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
    # prices.to_money
    sample_meals = []

    # self.each do |qty|
      # puts "to jest cos! #{qty}" - nie wchodzi nawet do petli

# # qty = self[0] #siwka temp
    for i in (0..self.length-1) do
      qty = self[i]

      selected_prices = qty.select_nonzero_indexes.select_result_prices(prices)
      qty -= [0]
      qty.validate_eq_length(selected_prices)
      selected_prices.validate_eq_length(qty)
      sample_meals += qty.combine_with(full_menu, selected_prices)
    end
    sample_meals
# ---pierwsza wersja---
    # qty = self
    # selected_prices = self.select_nonzero_indexes.select_result_prices(prices)
    
    # qty.validate_eq_length(selected_prices)
    # selected_prices.validate_eq_length(qty)

    # qty.combine_with(full_menu, selected_prices)

# ----------
    # chyba nie uzyje?    qty.combine(selected_prices).match_with_entrees_from(full_menu)

    # h.select{|k,v| v == "4.20"}.keys
    # selection =   hash.key(value) => key
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

  def combine_with(full_menu, prices)
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
end