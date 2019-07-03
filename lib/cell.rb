class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @empty = true
    @ship = ship
    @fired_upon = false

  end

  def place_ship(cruiser_or_sub)
    @ship = cruiser_or_sub
  end

  def empty?
    @ship.nil?
  end

  def fired_upon?
    if @ship.health < 3
      return true
    else
      return false
    end
  end

  def fire_upon
    @fired_upon = true
    if empty? == false
     return @ship.hit
    end
  end
end

  def render
    # if @ship.health === 0
    #   return "X"
    # if @ship.health < 3 && @ship.nil? == false
    #   return "H"
    if empty? && @fired_upon == true
      return "M"
    else empty? && @fired_upon == false
      return "."
    end
    end
  end
