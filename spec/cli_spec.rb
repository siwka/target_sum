require 'cli'

describe Cli do
  let(:cli) { described_class.new }

  it "should exit cleanly when no argv is used" do
    argv=[" "]
    expect(lambda { cli.exit_with_error_message }).to raise_error SystemExit
  end

  it "should give error_message_on_exit" do
    expect(STDOUT).to receive(:puts).with("\nYou forgot to add file name to command. Try again!\n\n")

    cli.error_message_on_exit
  end

  it "displays message that file has bad data" do
    expect(STDOUT).to receive(:puts).with("\nBad data in file. Try another file.\n\n")

    cli.announce_bad_target
  end

  it "displays message that machine is thinking next move" do
    expect(STDOUT).to receive(:puts).with('===================================================')
    expect(STDOUT).to receive(:puts).with('Machine is thinking ...')
    expect(STDOUT).to receive(:puts).with('===================================================')

    cli.display_machine_thinking
  end

  it "displays message that there is no solution for target of $15.60" do
    target = 1560
    expect(STDOUT).to receive(:puts).with("\nThere is no combination of dishes that will be equal in cost to the target price of $#{'%.02f' % target.fdiv(100)}.\n\n")

    cli.announce_no_combination(target)
  end

  it "displays message there is solution and list of menus" do
    target = 2375
    menus = {"frog legs" => 2375 }
    expect(STDOUT).to receive(:puts).with(">>>>>>>>>> * <<<<<<<<<<<<")
    expect(STDOUT).to receive(:puts).with("\nFOR THE TARGET PRICE OF $#{'%.02f' % target.fdiv(100)}, CHOICES ARE:\n\n")
    expect(STDOUT).to receive(:puts).with(">>>>>>>>>>>  1 - option  <<<<<<<<<<<<<")
    expect(STDOUT).to receive(:puts).with("\nQTY\tENTREE:\t\tPRICE\n\n")
    expect(STDOUT).to receive(:puts).with("===================================================")

    cli.announce_combination(target, menus)
  end
end