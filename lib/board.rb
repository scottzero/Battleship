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
        end
      end
  end

  def valid_placement?(ship, coordinate_array)

    #for each coordinate passed in check if an actual coordinate
    # require 'pry'; binding.pry
      coordinate_array.all? do |coordinate|
        valid_coordinate?(coordinate)
      end #enum .each

    #methods for each validation
    valid_coor_and_length = validate_coor_with_ship_length?(ship, coordinate_array)

    valid_consecutive_sub = validate_ships_consecutive_for_submarine?(ship, coordinate_array)
    valid_consecutive_cruiser = validate_ships_consecutive_for_cruiser?(ship, coordinate_array)
    # valid_no_overlap = validate_no_overlapping?(ship, coordinate_array)
    # valid_no_diagonal = validate_not_diagonal?(ship, coordinate_array)
    # require 'pry'; binding.pry

    valid_coor_and_length #calling length method

    # valid_no_overlap

    # if @cells.empty? == false
    #   return false
    # end



    if ship.length == 2
      valid_consecutive_sub
    else ship.length == 3
      valid_consecutive_cruiser
    end

    # coordinate_array.any? do |coordinate|
    #   if coordinate.empty? == false
    #     return false
    #   else
    #     return true
    #   end
    # end

  end

  def valid?(ship, coordinate_array)
    if coordinate_array.all? do |coordinate|
      valid_coordinate?(coordinate)
    end &&
    if ship.length == 2
      validate_ships_consecutive_for_submarine?(ship, coordinate_array)
    else ship.length == 3
      validate_ships_consecutive_for_cruiser?(ship, coordinate_array)
    end &&
    coordinate_array.any? do |coordinate|
      if coordinate.empty? == false
        return false
      end
    end
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
    total_ord_value_element_1_character_1 = 0
    total_ord_value_element_1_character_2 = 0
    total_ord_value_element_2_character_1 = 0
    total_ord_value_element_2_character_2 = 0
    coordinate_array.each_cons(2) do |coordinate_pair|
      total_ord_value_element_1_character_1 += coordinate_pair.first[0].ord
      total_ord_value_element_1_character_2 += coordinate_pair.first[1].ord
      total_ord_value_element_2_character_1 += coordinate_pair.last[0].ord
      total_ord_value_element_2_character_2 += coordinate_pair.last[1].ord
      end
    if total_ord_value_element_1_character_1 == total_ord_value_element_2_character_1 && total_ord_value_element_1_character_2 == total_ord_value_element_2_character_2 +-1
      return true
    elsif total_ord_value_element_1_character_2 == total_ord_value_element_2_character_2 && total_ord_value_element_1_character_1 == total_ord_value_element_2_character_1 +-1
      return true
    else
      return false
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




  # def validate_no_overlapping?(ship,coordinate_array)
  #   coordinate_array.all? do |coordinate|
  #     if coordinate.empty? == true
  #       return true
  #     else
  #       return false
  #   end #enum .each
  #   end
  # end


end #end class
