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
    @ship.nil?
  end

  # def fired_upon?
  #   fire_upon?
  # end
  #
  # def fire_upon
  #   @ship.hit
  # end


end
