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
end