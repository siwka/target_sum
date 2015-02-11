require 'cli'

describe Cli do
	let(:cli) { described_class.new }

 	xit "should convert first row from input to an integer" do
 		# csv = ['15.01']
 		allow(cli.read_csv_file).to receive(['15.01']).and_return(1501)
 		expect(cli.read_target).to eq(1501)
 	end

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
  	target = 15.60
  	expect(STDOUT).to receive(:puts).with("\nThere is no combination of dishes that will be equal in cost to the target price of $#{sprintf('%.02f',target)}.\n\n")

  	cli.announce_no_combination(target)
  end

  it "displays message there is solution and list of menus" do
  	target = 23.75 #siwka /100
  	menus = {"frog legs" => 2375 }
  	expect(STDOUT).to receive(:puts).with("\nFor target price of $#{sprintf('%.02f',target)} there are following menus of dishes:\n\n")
  	expect(STDOUT).to receive(:puts).with("#{menus}")  	

  	cli.announce_combination(target, menus)
  end
end