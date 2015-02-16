require 'calculator'

describe Calculator do
  let(:calculator) { Calculator.new }

  describe "eliminates unsolved examples" do
    it "estimates solution might exists, adds values to storng candidates" do
      target = 1021
      prices = [300, 244, 203]
      result = calculator.possible_solution_exist?(prices, target)
      expect(result).to eq [[1, 1, 2], true]
    end

    it "estimates solution might exists, adds values to storng candidates" do
      target = 1021
      prices = [300, 244, 221, 203, 101]
      result = calculator.possible_solution_exist?(prices, target)
      expect(result).to eq [[1, 1, 3, 2, 3], true]
    end

    it "estimates solution might exists, adds values to storng candidates" do
      target = 1022
      prices = [300, 244, 221, 203, 101]
      result = calculator.possible_solution_exist?(prices, target)
      expect(result).to eq [[1, 1, 1, 1, 1], true]
    end    

    it "checks solution does not exists" do
      target = 1021
      prices = [300, 244, 206]
      result = calculator.possible_solution_exist?(prices, target)
      expect(result).to eq [[1, 1, 1], false]
    end     
  end

  describe "calculates reasonable limits of number of duplicate dish" do
    it "returns 7 for arrays of max qty dish 7 & prices length 5" do
      prices = [580, 355, 335, 275, 215]
      max_qty_for_price = [2, 3, 4, 4, 5, 7]
      result = calculator.adjust_limits(max_qty_for_price, prices)
      expect(result).to eq 7
    end

    it "returns 7 for arrays of max qty dish 7 & prices length 5" do
      prices = [580, 355, 335, 320, 275, 215, 215, 144, 135, 120]
      max_qty = [2, 2, 3, 3, 3, 4, 4, 5, 7, 7]
      result = calculator.adjust_limits(max_qty, prices)
      expect(result).to eq 3
    end

    it "returns 7 for arrays of max qty dish 7 & prices length 5" do
      prices = [58, 35, 33, 32, 27, 22, 21, 19, 18, 17, 16, 15, 14, 13, 12]
      max_qty = [2, 2, 3, 3, 3, 4, 4, 5, 7, 7, 7, 7, 7, 7, 7]
      expect(lambda { calculator.adjust_limits(max_qty, prices) }).to raise_error SystemExit 
    end
  end
end
