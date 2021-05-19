require 'pry'

class Animal
  attr_reader :kind, :age
  def initialize(kind, weight, age)
      @kind = kind
      @weight = weight
      @age = age
  end

  def weight
    @weight.to_s + ' pounds'
  end

  def age
    @age.to_s + ' weeks'
  end

  def age_in_days
    @age.to_i * 7
  end

  def feed!(pounds)
    @weight = (@weight.to_i + pounds).to_s
  end
end
