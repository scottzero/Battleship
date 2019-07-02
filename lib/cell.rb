class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @empty = true
    @ship = ship
  end

  def place_ship(cruiser_or_sub)
    @ship = cruiser_or_sub
  end

  def empty?
    if @ship.nil?
      return true
    else
      return false
    end
  end
end
