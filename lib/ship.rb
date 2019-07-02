class Ship
  attr_reader :name, :health, :length
  def initialize(name, health)
    @name = name
    @health = 3
    @length = @health
  end

  def sunk?
    @health === 0 #evaluates to true if 0
  end

  def hit
    @health -= 1  #need a space between the - 1 when doing this.
    #@health
  end

end #end class
