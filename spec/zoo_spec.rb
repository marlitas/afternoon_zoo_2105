require './lib/animal'
require './lib/zoo'
require 'rspec'

RSpec.describe do

  it 'exists' do
    zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")

    expect(zoo).to be_a(Zoo)
  end

  it 'has attributes' do
    zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")

    expect(zoo.street).to eq('2300 Southern Blvd')
    expect(zoo.city).to eq('Bronx')
    expect(zoo.state).to eq('NY')
    expect(zoo.zip_code).to eq('10460')
  end

  it 'has an address' do
    zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")

    expect(zoo.address).to eq('2300 Southern Blvd Bronx, NY 10460')
  end

  it 'starts with an empty inventory' do
    zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")

    expect(zoo.inventory).to eq([])
  end

  it 'can count animals' do
    zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")

    expect(zoo.animal_count).to eq(0)
  end

  it 'can add animals' do
    zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")
    animal_1 = Animal.new("Sea Otter", 10, 25)
    animal_2 = Animal.new("Red Panda", 5, 70)

    zoo.add_animal(animal_1)
    zoo.add_animal(animal_2)

    expect(zoo.inventory).to eq([animal_1, animal_2])
    expect(zoo.animal_count).to eq(2)
  end

  context 'iteration 3' do
    before(:each) do
      @zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")

      @animal_1 = Animal.new("Sea Otter", 10, 25)
      @animal_2 = Animal.new("Red Panda", 5, 70)
      @animal_3 = Animal.new("Capybara", 100, 150)
      @animal_4 = Animal.new("Dolphin", 150, 200)

      @zoo.add_animal(@animal_1)
      @zoo.add_animal(@animal_2)
      @zoo.add_animal(@animal_3)
      @zoo.add_animal(@animal_4)
    end

    it 'can find animals by age' do
      expect(@zoo.animals_older_than(250)).to eq([])
      expect(@zoo.animals_older_than(100)).to eq([@animal_3, @animal_4])
      expect(@zoo.animals_older_than(10)).to eq([@animal_1, @animal_2, @animal_3, @animal_4])
    end

    it 'can calculate total weight of animals' do
      expect(@zoo.total_weight_of_animals).to eq(265)
    end

    it 'has details' do
      @zoo.total_weight_of_animals
      
      expect(@zoo.details).to eq({'total_weight' => 265, 'street_address' => '2300 Southern Blvd'})
    end
  end
end
