require 'pry'
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

  def valid_coordinate?(coordinate) #method 1
    @cells.keys.include?(coordinate)
  end

  def valid_placement?(ship, coordinate_array) #method 7
        validate_coor_with_ship_length?(ship, coordinate_array) && validate_no_overlapping?(ship,coordinate_array) && (validate_ships_consecutive_for_submarine?(ship, coordinate_array) || validate_ships_consecutive_for_cruiser?(ship, coordinate_array))
  end

  def validate_coor_with_ship_length?(ship, coordinate_array) #method 2
    if ship.length == coordinate_array.length
      return true
    end
  end


  def validate_ships_consecutive_for_submarine?(ship, coordinate_array) #method 3
      total_ord_value_first_element = 0
      total_ord_value_second_element = 0
      coordinate_array.each_cons(2) do |coordinate_pair|
      total_ord_value_first_element += (coordinate_pair.first[0].ord + coordinate_pair.first[1].ord)
    end
      coordinate_array.each_cons(2) do |coordinate_pair_2|
      total_ord_value_second_element += (coordinate_pair_2.last[0].ord + coordinate_pair_2.last[1].ord)
    end
    if total_ord_value_first_element == total_ord_value_second_element +-1
      return true
    else
      return false
    end
  end

  def validate_ships_consecutive_for_cruiser?(ship, coordinate_array) #method 4
      total_ord_value_first_element = 0
      total_ord_value_second_element = 0
      total_ord_value_third_element = 0
      coordinate_array.each_cons(3) do |coordinate_pair|
      total_ord_value_first_element += (coordinate_pair.first[0].ord + coordinate_pair.first[1].ord)
      total_ord_value_second_element += (coordinate_pair[1][0].ord + coordinate_pair[1][1].ord)
      total_ord_value_third_element += (coordinate_pair[2][0].ord + coordinate_pair[2][1].ord)
    end
      if total_ord_value_first_element == total_ord_value_second_element +-1 && total_ord_value_first_element == total_ord_value_third_element +-2
        return true
      else
        return false
      end
  end

  def validate_no_overlapping?(ship,coordinate_array) #method 5
    coordinate_array.all? do |coordinate|
       if @cells[coordinate].empty? == true
      return true
    else
      return false
    end
  end
end

  def place(ship,coordinate_array) #method 6
    if valid_placement?(ship,coordinate_array)
      coordinate_array.each do |coordinate|
        @cells[coordinate].place_ship(ship)
        end
      end
      return ship
  end



  def render

  end

end #end class
