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

  def render(ship_in_cell = false)
    if empty? && @fired_upon == true
      return "M"
    elsif empty? && @fired_upon == false
      return "."
    else ship_in_cell == !empty?
      return "S"
      # return "X"
    # if @ship.health < 3 && @ship.nil? == false
    #   return "H"

    end
  end
end
