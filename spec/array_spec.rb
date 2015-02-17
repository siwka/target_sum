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

  it "returns divisors of target if exist in array" do
    prices = [21, 15, 11, 7, 6, 3, 2]
    expect(prices.divisors_of(21)).to eq [[1, 3, 7], [21, 7, 3]]
  end

  it "calculate_limits(target, prices)" do
    expect([].calculate_limits(21, [7, 5, 2])).to eq [3, 4, 10]
  end

  it "converts integers array to array of strings as decimals with precision 2" do
    result = [2, 4, 6, 8].to_money
    expect(result).to eq ["0.02", "0.04", "0.06", "0.08"]
  end

  it "select_nonzero_indexes" do
    result = [1, 0, 2, 0, 0, 1].select_nonzero_indexes
    expect(result).to eq [0, 2, 5]
  end

  it "select_result_prices(prices)" do
    prices = ["0.02", "0.04", "0.06", "0.08"]
    result = [0, 2, 5].select_result_prices(prices)
    expect(result).to eq ["0.02", "0.06"]
  end

  it "combine arrays quantity with corresponding selected prices" do
    selected_prices = ["0.02", "0.06"]
    result = [1, 2, 1].combine(selected_prices)
    expect(result).to eq [[1, "0.02"], [2, "0.06"]]
  end

  it "match quantites with dishes names and its prices)" do
    menu = {"french fries"=>"2.75", "side salad"=>"3.35", "hot wings"=>"3.55", "mozzarella"=>"4.20", "sampler plate"=>"5.80", "sss"=>"4.20"}
    prices = ["2.75", "4.20"]
    result = [1, 2].match_with(menu, prices)
  	expect(result).to eq [[1, ["french fries"], "2.75"], [2, ["mozzarella", "sss"], "4.20"]]
  end

  it "removes last elements from longer array to make their length even" do
    selected_prices = ["2.02", "3.06", "5.02", "0.06"]
    result = [1, 2, 3].validate_eq_length(selected_prices)
    expect(result).to eq [1, 2, 3]
  end


  # Tests for match_prices_with_entrees pass
  # when first line in code prices.to_money is commented, otherwise
  # prices.to_money is called twice
  # Program works when prices.to_money is uncomented - check this - >?
  xit "match_prices_with_entrees for one result" do
    results = [[0, 0, 0, 0, 0, 7]]
    menu = {"expensive plate"=>"15.80", "mixed fruit"=>"2.15", "french fries"=>"2.75", "side salad"=>"3.35", "hot wings"=>"3.55", "mozzarella sticks"=>"4.20", "sampler plate"=>"5.80"}
    prices = ["5.80", "4.20", "3.55", "3.35", "2.75", "2.15"]
    result = results.match_prices_with_entrees(menu, prices)
    expect(result).to eq [[[7, ["mixed fruit"], "2.15"]]]
  end    

  xit "match_prices_with_entrees for two results" do
    results = [[0, 0, 0, 0, 0, 7], [1, 0, 2, 0, 0, 1]]
    menu = {"expensive plate"=>"15.80", "mixed fruit"=>"2.15", "french fries"=>"2.75", "side salad"=>"3.55", "hot wings"=>"3.55", "mozzarella sticks"=>"4.20", "sampler plate"=>"5.80"}
    prices = ["5.80", "4.20", "3.55", "3.35", "2.75", "2.15"]
    result = results.match_prices_with_entrees(menu, prices)
    expect(result).to eq [[[7, ["mixed fruit"], "2.15"]], [[1, ["sampler plate"], "5.80"], [2, ["side salad", "hot wings"], "3.55"], [1, ["mixed fruit"], "2.15"]]]
  end

  it "returns array containing elemtnst of odd indexes" do
    expect([0, 1, 2, 3, 4, 5, 6, 7, 8].odd_values).to eq [1, 3, 5, 7]
  end

  it "returns array containing elemtnst of even indexes" do
    expect([0, 1, 2, 3, 4, 5, 6, 7, 8].even_values).to eq [0, 2, 4, 6, 8]
  end

  it "returns prices on given indexes" do
    ind = [3, 4, 1]
    prices = [75, 150, 250, 35, 10, 100]

    expect(ind.retireve_from(prices)).to eq [35, 10, 150]
  end
end