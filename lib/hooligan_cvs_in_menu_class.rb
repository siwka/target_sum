# was in menu_spec.rb

# require 'csv'


  # it "returns all the entrees in a given price" do
  #   amount = 2.45
  #   @menu.get_entrees_in_price(:amount).length.should == 2
  # end

#csv << row.map!{ |e| e.gsub(/,\s+\"/,',\"') }

# considering to have:
    # menu_obj = [
    #   Entree.new("Mixed Fruit"  , '$2.15'),
    #   Entree.new("French Fries" , '$2.75'),
    #   Entree.new("Other Fries"  , '$2.75'),
    #   Entree.new("Side Salad"   , '$3.35'),
    #   Entree.new("Hot Wings"    , '$3.55'),
    #   Entree.new("Mozzarella St", '$3.55'),
    #   Entree.new("Sampler Plate", '$5.80')
    # ]

describe Menu do
  before :all do
    menu_obj = [
      ['$17.20'],
      ['Mixed Fruit'  , '$2.15'],
      ['French Fries' , '$2.75'],
      ['Other Fries'  , '$2.75'],
      ['Side Salad'   , '$3.35'],
      ['Hot Wings'    , '$3.55'],
      ['Mozzarella St', '$3.55'],
      ['Sampler Plate', '$5.80']
    ]
    CSV.open('new_data.csv', 'w') do |csv|
      menu_obj.each do |row|
        csv << row 
      end
    end
  end    