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

  def place(ship,coordinate_array)
    if valid_placement?(ship,coordinate_array)
      coordinate_array.each do |coordinate|
        @cells[coordinate].place_ship(ship)
        #require 'pry';binding.pry
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
    valid_consecutive_sub = validate_ships_consecutive_for_submarine?(ship, coordinate_array)
    valid_consecutive_cruiser = validate_ships_consecutive_for_cruiser?(ship, coordinate_array)
    valid_no_overlap = validate_no_overlapping?(ship, coordinate_array)
    # valid_no_diagonal = validate_not_diagonal?(ship, coordinate_array)
    valid_coor_and_length #calling length method
    if ship.length == 3
    valid_consecutive_cruiser
  end
  if ship.length == 2
    valid_consecutive_sub
  end
  end

  def validate_coor_with_ship_length?(ship, coordinate_array)
  #if valid, should return true, this works for length
  if ship.length == coordinate_array.length
    return true
  end
  #require 'pry'; binding.pry
  end #end length method

  def validate_ships_consecutive_for_submarine?(ship, coordinate_array)
    total_ord_value_first_element = 0
    total_ord_value_second_element = 0
    coordinate_array.each_cons(2) do |coordinate_pair|
      # require 'pry';binding.pry
      total_ord_value_first_element += (coordinate_pair.first[0].ord + coordinate_pair.first[1].ord)
    coordinate_array.each_cons(2) do |coordinate_pair_2|
      total_ord_value_second_element += (coordinate_pair_2.last[0].ord + coordinate_pair_2.last[1].ord)
      # require 'pry';binding.pry
    if total_ord_value_first_element == total_ord_value_second_element +-1
      #require 'pry';binding.pry
      return true
    else
      return false
    end
  end

  end

  end

  def validate_ships_consecutive_for_cruiser?(ship, coordinate_array)
    total_ord_value_first_element = 0
    total_ord_value_second_element = 0
    total_ord_value_third_element = 0
    coordinate_array.each_cons(3) do |coordinate_pair|
      # require 'pry';binding.pry
      total_ord_value_first_element += (coordinate_pair.first[0].ord + coordinate_pair.first[1].ord)
      total_ord_value_second_element += (coordinate_pair[1][0].ord + coordinate_pair[1][1].ord)
      total_ord_value_third_element += (coordinate_pair[2][0].ord + coordinate_pair[2][1].ord)
    end
      # require 'pry';binding.pry
    if total_ord_value_first_element == total_ord_value_second_element +-1 && total_ord_value_first_element == total_ord_value_third_element +-2
      return true
    else
      return false
    end
  end




  def validate_no_overlapping?(ship,coordinate_array)
    #logic for checking if ships dont overlap
  end


end #end class
