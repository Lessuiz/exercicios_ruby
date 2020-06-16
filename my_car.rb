class MyCar
  attr_reader :color, :year
  attr_writer :color

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
end

corolla = MyCar.new(2010, "Red", "Corolla")
corolla.current_speed
corolla.speed_up(35)
corolla.current_speed
corolla.brake(35)
corolla.shut_down
corolla.spray_paint("Blue")
