class Menu
	attr_accessor :entrees

	def initialize menu_file = false
    @menu_file = menu_file
    @entrees = @menu_file ? read_csv_file : []
  end

	def read_csv_file
  	@csv_to_a = []
		CSV.foreach(ARGV.first, headers: false) do |row|
			@csv_to_a << (row.map!{ |e| e.gsub(/[$]/,'') } if !row.nil?) #siwka spr warunek!
		end
	end

	def read_target
		target = @csv_to_a.shift.join('').delete('.').to_i
	end

  def get_entree name
    @entrees.select do |entree|
      entree.name == name
    end.first
  end	
end