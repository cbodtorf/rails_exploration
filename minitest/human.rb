class Human
  attr_accessor :alertness

  def initialize(name)
    @name = name
    @alertness = 0
  end
  def has_coffee?
    if @coffee == nil
      return false
    else
      return @coffee.full?
    end
  end
  def needs_coffee?
    if @coffee == nil
      return true
    else
      return @coffee.empty?
    end
  end
  def buy(coffee)
      @coffee = coffee
  end
  def drink!
    if !@coffee.empty?
      @coffee.status -= 1
      @alertness += 0.33
    else
      return "eeek, no coffee"
    end

  end
end
