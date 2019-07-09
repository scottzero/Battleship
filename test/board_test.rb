
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_if_board_exists
    assert_instance_of Board, @board
  end

  def test_if_board_has_cells
    assert_instance_of Hash, @board.cells
    assert_equal 16, @board.cells.length
  end
  #coordinate validation
  def test_method_valid_coordinate? #method 1,passed

    assert @board.valid_coordinate?("A1")
    assert @board.valid_coordinate?("D4")
    refute @board.valid_coordinate?("A5")
    refute @board.valid_coordinate?("E1")
    refute @board.valid_coordinate?("A22")

    assert @board.verify_valid_coordinate?(@submarine, ["D1", "D2"])
    assert @board.verify_valid_coordinate?(@cruiser, ["B2","C2", "D2"])
    refute @board.verify_valid_coordinate?(@submarine, ["A4", "A5"])
    refute @board.verify_valid_coordinate?(@cruiser, ["E1", "E2", "E3"])
    refute @board.verify_valid_coordinate?(@cruiser, ["A22", "A23", "A24"])

    assert @board.valid_placement?(@submarine, ["D1", "D2"])
    assert @board.valid_placement?(@cruiser, ["B2","C2", "D2"])
    refute @board.valid_placement?(@submarine, ["A4", "A5"])
    refute @board.valid_placement?(@cruiser, ["E1", "E2", "E3"])
    refute @board.valid_placement?(@cruiser, ["A22", "A23", "A24"])
  end

  #ship placement validation
  def test_if_number_or_coordinates_in_array_is_same_as_ship_length
    #reverse testing for true and false
    #assert with correct number of coordinates per ship size
    assert_equal true, @board.validate_coor_with_ship_length?(@submarine, ["A1", "A2"])
    assert_equal true, @board.validate_coor_with_ship_length?(@cruiser, ["A1", "A2", "A4"])
    #refute with incorrect number of coordinates per ship size
    refute @board.validate_coor_with_ship_length?(@cruiser, ["A1", "A2"])
    refute @board.validate_coor_with_ship_length?(@submarine, ["A1", "A3", "A4"])

# require 'pry'; binding.pry
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])
    assert_equal true, @board.valid_placement?(@cruiser, ["A1", "A2", "A3"])
    # refute with incorrect number of coordinates per ship size
    refute @board.valid_placement?(@cruiser, ["A1", "A2"])
    refute @board.valid_placement?(@submarine, ["A2", "A3", "A4"])

  end

  def test_if_coordinates_are_consecutive_submarine #method 3,passed

    refute @board.validate_ships_consecutive_for_submarine?(@submarine, ["A1","C1"])
    refute @board.validate_ships_consecutive_for_cruiser?(@cruiser, ["A1", "A2", "A4"])
    refute @board.validate_ships_consecutive_for_cruiser?(@cruiser, ["A1", "A2", "C1"])

    refute @board.valid_placement?(@submarine, ["A1","C1"])
    refute @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])

    # require 'pry'; binding.pry
    assert_equal true, @board.valid_placement?(@submarine, ["B1", "C1"])
    assert_equal true, @board.valid_placement?(@cruiser, ["A1","A2","A3"])
    assert_equal true, @board.valid_placement?(@submarine, ["D1","D2"])

    assert_equal true, @board.validate_ships_consecutive_for_submarine?(@submarine, ["B1", "C1"])
    assert_equal true, @board.validate_ships_consecutive_for_cruiser?(@cruiser, ["A1","A2","A3"])
    assert_equal true, @board.validate_ships_consecutive_for_submarine?(@submarine, ["D1","D2"])

    # if a cruiser should be  "A1" "A2" "A3" true
    refute @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    refute @board.valid_placement?(@submarine, ["A1","B2"])
    refute @board.valid_placement?(@submarine, ["C2", "D3"])
  end

  def test_if_ships_overlap

    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert_equal false, @board.validate_no_overlapping?(@submarine, ["A1", "B1"])
    assert_equal false, @board.validate_no_overlapping?(@submarine, ["A3", "A4"])
    assert_equal true, @board.validate_no_overlapping?(@submarine, ["C1", "D1"])

    assert_equal false, @board.valid_placement?(@submarine, ["A1", "B1"])
    assert_equal false, @board.valid_placement?(@submarine, ["A3", "A4"])
    assert_equal true, @board.valid_placement?(@submarine, ["C1", "D1"])

  end

  def test_we_can_place_ship

    @board.place(@cruiser, ["A1", "A2", "A3"])
    @board.place(@submarine, ["C3", "C4"])
    @cell_1 = @board.cells["A1"]
    @cell_2 = @board.cells["A2"]
    @cell_3 = @board.cells["A3"]
    @cell_4 = @board.cells["C3"]
    @cell_5 = @board.cells["C4"]

    assert_equal @cruiser, @cell_1.ship
    assert_equal @cruiser, @cell_2.ship
    assert_equal @cruiser, @cell_3.ship
    assert_equal @submarine, @cell_4.ship
    assert_equal @submarine, @cell_5.ship
    assert_equal @cell_2.ship, @cell_3.ship
    # assert_equal @submarine, @cell_4.ship
    # assert_equal @submarine, @cell_5.ship
  end

  def test_that_it_renders_plain_board
    @board.place(@cruiser, ["A1", "A2", "A3"])

    assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n", @board.render
  end

  def test_that_it_renders_plain_board_and_shows_ship
    @board.place(@cruiser, ["A1", "A2", "A3"])

    assert_equal "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n", @board.render(true)
  end

  def test_that_it_renders_board_with_a_miss
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @board.fire_upon("A4")

    assert_equal "  1 2 3 4 \nA . . . M \nB . . . . \nC . . . . \nD . . . . \n", @board.render
  end

  def test_that_it_renders_board_with_a_miss_and_a_hit
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @board.fire_upon("A4")
    @board.fire_upon("A3")

    assert_equal "  1 2 3 4 \nA . . H M \nB . . . . \nC . . . . \nD . . . . \n", @board.render
  end

  def test_that_it_renders_board_with_four_misses_and_one_hit_and_a_sunken_cruiser
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @board.place(@submarine, ["D2", "D3"])
    @board.fire_upon("A4")
    @board.fire_upon("A3")
    @board.fire_upon("B3")
    @board.fire_upon("A2")
    @board.fire_upon("A1")
    @board.fire_upon("C4")
    @board.fire_upon("D1")
    @board.fire_upon("D3")

    assert_equal "  1 2 3 4 \nA X X X M \nB . . M . \nC . . . M \nD M . H . \n", @board.render
  end

  def test_that_it_renders_board_with_four_misses_and_one_hit_and_a_sunken_cruiser_and_shows_rest_of_submarine
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @board.place(@submarine, ["D2", "D3"])
    @board.fire_upon("A4")
    @board.fire_upon("A3")
    @board.fire_upon("B3")
    @board.fire_upon("A2")
    @board.fire_upon("A1")
    @board.fire_upon("C4")
    @board.fire_upon("D1")
    @board.fire_upon("D3")

    assert_equal "  1 2 3 4 \nA X X X M \nB . . M . \nC . . . M \nD M S H . \n", @board.render(true)
  end

end #end class
