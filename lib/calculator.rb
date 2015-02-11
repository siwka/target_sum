class Calculator

	def initialize
	end

	def adjust_limits(limit_entree_qty, prices)
		limit = limit_entree_qty.max
		if (prices.length > 6 && limit > 6)
		  limit = case prices.length
		    when 7 then 7
		    when 8 then 6
		    when 9 then 5
		    when 10, 11 then 3
		    when 12 then 4
		    when 13, 14 then 2
		    else
		      puts "\nCHOOSE SHORTER MENU!\n\n"
		      exit(2)
		  end
		end
		limit
	end

	def combination_any?
	end
end