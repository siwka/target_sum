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

  context "#knapsack_no_repetition" do
    it "one: returns knapsack & keepitem - tracking solution array for:" do
      t = 10
      p = [ 7,   8,   6,  4,  3,   9]
      v = [75, 150, 250, 35, 10, 100]

      knapsack =[[0, 0, 0, 0,   0,  0,   0,   0,   0,   0,   0],
                 [0, 0, 0, 0,   0,  0,   0,  75,  75,  75,  75],
                 [0, 0, 0, 0,   0,  0,   0,  75, 150, 150, 150],
                 [0, 0, 0, 0,   0,  0, 250, 250, 250, 250, 250],
                 [0, 0, 0, 0,  35, 35, 250, 250, 250, 250, 285],
                 [0, 0, 0, 10, 35, 35, 250, 250, 250, 260, 285],
                 [0, 0, 0, 10, 35, 35, 250, 250, 250, 260, 285]]

      keepitem =[[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1],
                 [0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2],
                 [0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3],
                 [0, 0, 0, 0, 4, 4, 0, 0, 0, 0, 4],
                 [0, 0, 0, 5, 0, 0, 0, 0, 0, 5, 0],
                 [0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0]]

      expect(calculator.knapsack_no_repetition(t,p,v)).to eq [knapsack, keepitem]
    end

    it "two: returns knapsack & keepitem - tracking solution array for:" do
      t = 5
      p = [3, 2, 1]
      v = [5, 3, 4]

      knapsack =[[0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 5, 5, 5],
                 [0, 0, 3, 5, 5, 8],
                 [0, 4, 4, 7, 9, 9]]

      keepitem =[[0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 1, 1, 1],
                 [0, 0, 2, 0, 0, 2],
                 [0, 3, 3, 3, 3, 3]]

      expect(calculator.knapsack_no_repetition(t,p,v)).to eq [knapsack, keepitem]
    end
  end

  context "#retireve_solution_from" do
    it "returns items 3 & 2 for following data:" do
      target = 10
      prices = [ 7,   8,   6,  4,  3,   9]

      keepitem =[[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1],
                 [0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2],
                 [0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3],
                 [0, 0, 0, 0, 4, 4, 0, 0, 0, 0, 4],
                 [0, 0, 0, 5, 0, 0, 0, 0, 0, 5, 0],
                 [0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0]]

      expect(calculator.retireve_solution_from(keepitem, target, prices)).to eq [3, 2]
    end

    it "returns items 2 & 0 for following data:" do
      target = 5
      prices = [3, 2, 1]

      keepitem =[[0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 1, 1, 1],
                 [0, 0, 2, 0, 0, 2],
                 [0, 3, 3, 3, 3, 3]]

      expect(calculator.retireve_solution_from(keepitem, target, prices)).to eq [2, 0]
    end
  end   
end
