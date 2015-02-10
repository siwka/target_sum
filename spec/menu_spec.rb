# require 'menu'
# require 'csv'

# describe Menu do
#   before :each do
#     @menu = Menu.new 'new_data.csv'
#   end

#   describe '#new' do
#     context 'with no parameters' do
#       it 'has no entrees' do
#         menu = Menu.new
#         expect(menu.entrees).to be_empty
#       end
#     end

#     context 'with a csv file parameter' do
#       it 'has seven entrees' do
#         expect(@menu.entrees.count).to eq(7) unless @menu.entrees.nil?
#       end
#     end
#   end
# end
