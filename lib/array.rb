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

  def check_subset_sum(prices, target)
    self.each do |a|
      tmp = a.zip(prices).map { |x,y| x*y } unless prices.nil?
      suma = tmp.reduce(:+) unless tmp.nil?
      puts "Solution exists! For #{a} and target price=#{suma}"  if suma == target
    end
  end

  def odd_values
    self.values_at(* self.each_index.select {|i| i.odd?})
  end

  def even_values
    self.values_at(* self.each_index.select {|i| i.even?})
  end
end