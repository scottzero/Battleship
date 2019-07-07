class Board
  attr_reader :cells

  def initialize
    @cells = cell_generator
  end

  def cell_generator
    {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

scott_iteration_2
  def place(ship,coordinate_array)
    if valid_placement?(ship,coordinate_array)
      coordinate_array.each do |coordinate|
        @cells[coordinate].place_ship(cruiser_or_sub)
        end
      end
  end

  def valid_placement?(ship, coordinate_array)
    #for each coordinate passed in check if an actual coordinate
      coordinate_array.each do |coordinate|
        if valid_coordinate?(coordinate) == false
          return false
        end #end if
      end #enum .each
    #methods for each validation
    valid_coor_and_length = validate_coor_with_ship_length?(ship, coordinate_array)
    valid_consecutive = validate_ships_consecutive?(ship, coordinate_array)
    valid_no_overlap = validate_no_overlapping?(ship, coordinate_array)
    valid_no_diagonal = validate_not_diagonal?(ship, coordinate_array)
    valid_coor_and_length #calling length method
  end

  def validate_coor_with_ship_length?(ship, ship_coordinates)
  #if valid, should return true, this works for length
  if ship.length == ship_coordinates.length
    return true
  end
  #require 'pry'; binding.pry
end #end length method

  def validate_ships_consecutive?(ship, coordinate_array)
    #logic for checking coordinate consecutive
  end

  def validate_no_overlapping?(ship,coordinate_array)
    #logic for checking if ships dont overlap
  end

  def validate_not_diagonal?(ship, coordinate_array)
    #logic for checking ships not diagonal
  end

end #end class
