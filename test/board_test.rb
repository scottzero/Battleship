
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
  def test_it_can_validate_coordinates_on_board
    assert @board.valid_coordinate?("A1")
    assert @board.valid_coordinate?("D4")
    refute @board.valid_coordinate?("A5")
    refute @board.valid_coordinate?("E1")
    refute @board.valid_coordinate?("A22")
  end

  #ship placement validation
  def test_if_number_or_coordinates_in_array_is_same_as_ship_length
    #reverse testing for true and false
    #assert with correct number of coordinates per ship size
    assert @board.validate_coor_with_ship_length?(@submarine, ["A1", "A2"])
    assert @board.validate_coor_with_ship_length?(@cruiser, ["A1", "A2", "A4"])
    #refute with incorrect number of coordinates per ship size
    refute @board.validate_coor_with_ship_length?(@cruiser, ["A1", "A2"])
    refute @board.validate_coor_with_ship_length?(@submarine, ["A1", "A3", "A4"])
  end

  def test_if_coordinates_are_consecutive

    #if a cruiser should be  "A1" "A2" "A3" true
    refute @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    refute @board.validate_ships_consecutive_for_submarine?(@submarine, ["A1","C1"])
    refute @board.validate_ships_consecutive_for_submarine?(@submarine, ["C1", "B1"])
    assert @board.valid_placement?(@cruiser, ["A1","A2","A3"])
    assert @board.validate_ships_consecutive_for_submarine?(@submarine, ["B2","B3"])
  end

  def test_if_coordinates_are_diagonal

    #if a cruiser should be  "A1" "A2" "A3" true
    refute @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    refute @board.validate_ships_consecutive_for_submarine?(@submarine, ["A1","B2"])
    #refute @board.valid_placement?(@submarine, ["C2", "D3"])
  end

  def test_if_ships_overlap
    skip
  end

  # def test_we_can_place_ship
  #
  #   @board.place(@cruiser, ["A1", "A2", "A3"])
  #   @board.place(@submarine,["C2","C3"])
  #   @cell_1 = @board.cells["A1"]
  #   @cell_2 = @board.cells["A2"]
  #   @cell_3 = @board.cells["A3"]
  #   @cell_4 = @board.cells["C2"]
  #   @cell_5 = @board.cells["C3"]
  #
  #   assert_equal @cruiser, @cell_1.ship
  #   assert_equal @cruiser, @cell_2.ship
  #   assert_equal @cruiser, @cell_3.ship
  #   assert @cell_2.ship == @cell_3.ship
  #
  #   # assert_equal @submarine, @cell_4.ship
  #   # assert_equal @submarine, @cell_5.ship
  # end

end #end class
