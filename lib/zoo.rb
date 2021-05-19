require 'pry'

class Zoo
  attr_reader :street, :city, :state, :zip_code, :inventory
  def initialize (name, street, city, state, zip_code)
    @name = name
    @street = street
    @city = city
    @state = state
    @zip_code = zip_code
    @inventory = []
    @total_weight = 0
  end

  def address
    "#{@street} #{@city}, #{@state} #{@zip_code}"
  end

  def animal_count
    @inventory.count
  end

  def add_animal(animal)
    @inventory << animal
  end

  def animals_older_than(weeks)
    inventory.find_all do |animal|
      animal.age.to_i > weeks
    end
  end

  def total_weight_of_animals
    inventory.each { |animal| @total_weight += animal.weight.to_i }
    return @total_weight
  end

  def details
    {'total_weight' => @total_weight, 'street_address' => @street}
  end
end
