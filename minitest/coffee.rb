class Coffee
  attr_accessor :status
  def initialize(type)
    @type = type
    @status = 3
  end
  def full?
    return @status == 3
  end
  def empty?
    return @status == 0
  end
end
