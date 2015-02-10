require 'csv'

csv = []
CSV.foreach(ARGV.first, headers: false) do |row|
  csv << row.map!{ |e| e.gsub(/[$]/,'') }
end

total = csv.shift.join('').delete('.').to_i
puts full_menu = Hash[*csv.flatten]

prices = []
prices = full_menu.values.sort.reverse!  #calculator - robie bez reverse siwka
puts prices.map!{ |a| a.delete('.').to_i }

qty_min = Array.new(prices.length, 0)
qty_max = []
for i in (0..prices.length-1) do
	qty_max << (total / prices[i])
end

perm = [0, 1, 2, 3, 4, 5, 6, 7].repeated_permutation(6).to_a

perm.select! do |arr|
	arr.each_with_index { |a,i| a[i]<=qty_max[i] }
end

perm.each do |pr|
  tmp = pr.zip(prices).map { |x,y| x*y }
	suma = tmp.reduce(:+)
	puts "Solution! for #{pr} total=$#{suma}"  if suma == total
end