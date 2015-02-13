require 'quest'
require 'cli'

describe Quest do
  let(:cli)   { Cli.new }
  let(:quest) { described_class.new(cli) }

  context "when new quest is created" do
    it "quest should be an instance of a Quest (described_class)" do
      expect(quest).to be_instance_of Quest
    end

    it "has cli" do
      expect(quest.cli).not_to be_nil
    end
  end

  context "start" do
    it "starts the quest" do
      expect(quest).to receive(:start)

      quest.start
    end
  end  

  context "while quest is ongoing" do
    it "returns 'boring' meal containing of one entree that price is divider of target price" do
      quest.full_menu = {"fruit"=>"3.00", "salad"=>"5.00", "fries"=>"3.03"}
      quest.prices = [300, 500, 303]
      quest.target = 600
      expect(quest.run_boring_menu).to eq [[[2, ["fruit"], "3.00"]]]
    end

    it "#run_permutation" do
      if quest.cli.all_choices? == true
      quest.full_menu = {"fruit"=>"3.00", "salad"=>"3.00",
                         "fries"=>"2.50", "cake" =>"3.50"}
      quest.prices = [300, 500, 250, 350]
      quest.target = 600
      expect(quest.run_permutation).to eq [
                            [[1, ["fries"], "2.50"], [1, ["cake"], "3.50"]],
                            [[2, ["fruit", "salad"], "3.00"]]]
      end
    end
  end

  context "finish" do
    it "finishes the quest" do
      expect(quest).to receive(:finish)

      quest.finish
    end
  end   
end