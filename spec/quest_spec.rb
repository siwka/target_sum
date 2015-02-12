require 'quest'

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
    it "runs the quest" do
      expect(quest).to receive(:run)

      quest.run
    end
  end

  context "finish" do
    it "finishes the quest" do
      expect(quest).to receive(:finish)

      quest.finish
    end
  end   
end