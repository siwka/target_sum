require 'csv'


# module IntConst
	FIXNUM_MAX = (2**(0.size * 8 -2))
	FIXNUM_MIN = -(2**(0.size * 8 -2))
# end


csv = []
CSV.foreach(ARGV.first, headers: false) do |row|
  # puts row.inspect # hash
  csv << row.map!{ |e| e.gsub(/[$]/,'') }
end

total = csv.shift.join('').delete('.').to_i
puts full_menu = Hash[*csv.flatten]
# Hash[*names.zip(hobbies).flatten]

prices = []
prices = full_menu.values.sort.reverse!  #calculator - robie bez reverse siwka
puts prices.map!{ |a| a.delete('.').to_i }


# class Array
#   def odd_values
#     self.values_at(* self.each_index.select {|i| i.odd?})
#   end
#   def even_values
#     self.values_at(* self.each_index.select {|i| i.even?})
#   end
# end

qty_min = Array.new(prices.length, 0)
qty_max = []
for i in (0..prices.length-1) do
	qty_max << (total / prices[i])
	# puts "#{i}-ty element #{prices[i]} total_mod= #{qty_max}"
end

perm = [0, 1, 2, 3, 4, 5, 6, 7].repeated_permutation(6).to_a
# perm.select! {|a| a[0]<=2 && a[1]<=3 && a[2]<=4 && a[3]<=4 && a[4]<=5 }
# perm.select! {|a| a[0]<=qty_max[0] && a[1]<=qty_max[1] && a[2]<=qty_max[2] && a[3]<=qty_max[3] && a[4]<=qty_max[4] }
#zamienic potem!

perm.select! do |arr|
	arr.each_with_index { |a,i| a[i]<=qty_max[i] }
end

# argum = []
perm.each do |pr|
  tmp = pr.zip(prices).map { |x,y| x*y }
  # print "prices: #{prices}, tmp: #{tmp}"
# 	argum << tmp
	suma = tmp.reduce(:+)
	# print " suma: #{suma}"
	  # puts'-----'
	puts "jest! Dla #{pr}tmp suma=#{suma}"  if suma == total
end

# puts argum.reduce(:+)


# -------------
# a = [1, 2, 3]
# a.repeated_permutation(3).to_a 
# http://mokik.p2004a.com/pliki/wydawanie_reszty.pdf
# ---------


# w = Array.new(total, FIXNUM_MAX)
# w[0] = 0
# for i in 0..prices.length-1
# 	puts value = prices[i]
# 	for j in 0..total-value
# 		unless w[j+value].nil?
# 		w[j+value] = w[j] + 1 if (w[j+value] > w[j] + 1 && w[j] != FIXNUM_MAX)
# 		end
# 	end

# 	if w[total] = FIXNUM_MAX
# 		puts 'nie ma dokladnej sumy'
# 	else
# 		puts "najmniejsza ilość wykorzystanych elementów których suma wynosi costam: #{w[total]}"
# 	end
# end