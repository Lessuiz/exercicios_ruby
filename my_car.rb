class Vehicle
  @@number_of_vehicles = 0

  def initialize
    @@number_of_vehicles += 1
  end

  def gas_mileage(liters, kilometers)
    puts "#{kilometers/liters} kilometers per liter."
  end
end

class MyCar < Vehicle
  attr_reader :color, :year, :model
  attr_writer :color

  NUMBER_OF_DOORS = 4

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def current_speed
    puts "You are currently going at #{@current_speed}Km/h."
  end

  def speed_up(velocity)
    @current_speed += velocity
    puts "You step on the gas and accelerate #{velocity}Km/h."
  end

  def brake(velocity)
    @current_speed -= velocity
    puts "You step on the brake and decelerate #{velocity}Km/h."
  end

  def shut_down
    puts "Let's park this bad boy out."
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job is awesome!"
  end

  def to_s
    "My car is a #{color}, #{year}, #{model}."
  end
end

class MyTruck
  NUMBER_OF_DOORS = 2
end

corolla = MyCar.new(2010, "Red", "Corolla")
corolla.current_speed
corolla.speed_up(35)
corolla.current_speed
corolla.brake(35)
corolla.shut_down
corolla.spray_paint("Blue")
corolla.gas_mileage(20, 500)
puts corolla
