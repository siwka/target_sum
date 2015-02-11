require 'array'

describe Array do

	let (:permutation) { [[7, 3, 7, 6, 5, 4], [7, 3, 7, 6, 5, 5],
		[7, 3, 7, 6, 5, 6], [7, 3, 7, 6, 5, 7], [7, 3, 7, 6, 6, 0],
		[7, 3, 7, 6, 6, 1], [7, 7, 7, 7, 6, 5], [7, 7, 7, 7, 6, 6],
		[1, 5, 7, 7, 6, 7], [1, 2, 3, 2, 3, 0], [3, 3, 3, 3, 3, 1],
		[1, 1, 2, 0, 0, 2], [3, 3, 7, 7, 7, 3], [7, 7, 7, 7, 7, 4],
		[7, 7, 7, 7, 7, 5], [7, 7, 7, 7, 7, 6], [7, 7, 7, 7, 7, 7]] }
	let (:limits_arr) { [4, 4, 4, 4, 4 ,4] }

	it "reject_each_more_than(limits_arr)" do
		result = permutation.reject_each_more_than(limits_arr)
		expect(result).to eq [[1, 2, 3, 2, 3, 0], [3, 3, 3, 3, 3, 1], [1, 1, 2, 0, 0, 2]]
	end

	it "removes values from array taht are bigger than 7" do
		result = permutation[0].reject_expensive(7)
		expect(result).to eq [3, 6, 5, 4]
	end

	it "removes values from array taht are bigger than 3" do
		result = permutation[9].reject_expensive(3)
		expect(result).to eq [1, 2, 2, 0]
	end

	it "removes values from array taht are bigger 6" do
		result = permutation[5].reject_expensive(6)
		expect(result).to eq [3, 1]
	end

	it "removes values from array taht are bigger than a given number" do
		result = [580, 355, 335, 275, 215].reject_expensive(1720)
		expect(result).to eq [580, 355, 335, 275, 215]
	end		
end