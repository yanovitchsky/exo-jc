module Flyable
  def fly
    puts "I'm flying"
  end

  def looping
    puts "I'm looping"
  end
end

class Vehicule
  attr_accessor :name

  def initialize
    @name = "Vehicule"
  end

  def move
    puts "#{@name}: I'm moving"
  end

  def stop
    puts "#{@name}: I'm stopping"
  end

  def speed_up
    puts "#{@name}: I'm speeding up"
  end

  def slow_down
    puts "#{@name}: I'm slowing down"
  end

  def super_method
    clean
  end

  protected
  def repair
    puts "#{@name}: I'm repairing"
  end

  private
  def clean
    puts "#{@name}: I'm cleaning"
  end
end

class Car < Vehicule
  attr_accessor :color, :model

  def initialize(name:, color:, model:)
    @name = name
    @color = color
    @model = model
  end

  def park
    puts "#{@name}: I'm parking"
  end

  def fast_and_furious
    slow_down
    speed_up
  end
end

class SuperCar < Car
  include Flyable
  def fast_and_furious
    super
    puts "#{@name}: I'm going super fast"
  end

  def double(car)
    car.repair
    puts "#{@name}: I'm going super fast again"
  end
end

class Chicken
  include Flyable
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def eat
    puts "#{@name} is eating"
  end

  def hatch
    lay_eggs
    build_nest
    puts "#{@name} is hatching"
  end

  private
  def lay_eggs
    puts "#{@name} is laying eggs"
  end

  def build_nest
    puts "#{@name} is building a nest"
  end
end

# v1 = Car.new(name: "Car", color: "Red", model: "2019")
# v1 = Car.new(color: "Red", model: "2019", name: "Car")
# puts v1.name
# v1.name = "Car"
# puts v1.name
# puts v1.color
# puts v1.model
# v1.fast_and_furious


# v2 = SuperCar.new(name: "SuperCar", color: "Blue", model: "2020")

# v2.fast_and_furious
# v2.fly
# v2.looping


# chicken = Chicken.new("Chicken")
# chicken.eat
# chicken.fly
# chicken.looping

v1 = Vehicule.new
v1.super_method

vx = Car.new(name: "Car", color: "Red", model: "2019")

v2 = SuperCar.new(name: "SuperCar", color: "Blue", model: "2020")
v2.super_method
v2.double(vx)
vx.repair

# chicken.hatch
# chicken.lay_eggs
# chicken.build_nest