require 'entree'

describe Entree do
	let(:entree) { Entree.new 'Name', '3.55' }
	
	describe '#new' do
		it "takes two parameters and returns described_class Entree object" do
			expect(entree).to be_instance_of Entree
		end
	end

	describe "#name" do
    it "should respond with the correct name" do
       expect(entree.name).to eql "Name"
    end
	end	
end