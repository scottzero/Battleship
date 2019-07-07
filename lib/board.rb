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

  def valid_placement?(ship, coordinate_array)
    #buggy functions need to fix
    coordinate_array.each do |coordinate|
      return false if valid_coordinate?(coordinate) == false
    end
    #need methods for each of these validations
    valid_length = valid_ship_length?(ship, coordinate_array) #checking if ship length is the same as number of coordinates

    #need to check if consecutive... currently broken 
    # row_adjacent = same_row_and_adjacent?(ship, ship_coordinates)
    # column_adjacent = same_column_and_adjacent?(ship,ship_coordinates)
  end

  def valid_ship_length?(ship, ship_coordinates)
  #if valid, should return true, this works for length
  ship.length == ship_coordinates.length
  end

end #end class
