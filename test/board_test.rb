
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
  end

  def test_valid_placement_works
    assert @board.valid_placement?(@submarine, ["A1", "A2"])
    refute @board.valid_placement?(@submarine, ["A1", "B2"])
    assert @board.valid_placement?(@cruiser, ["A1", "A2", "A3"])
    assert @board.valid_placement?(@cruiser, ["A1", "B1", "C1"])

    refute @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    refute @board.valid_placement?(@cruiser, ["B1", "B2", "C3"])
    refute @board.valid_placement?(@cruiser, ["B1", "B2"])
    refute @board.valid_placement?(@submarine, ["A1", "A3"])
    refute @board.valid_placement?(@submarine, ["A1", "A3"])
    refute @board.valid_placement?(@submarine, ["A1", "A2", "A3"])
  end

  def test_valid_coor_with_ship_length_method #method 2,passed

    assert @board.validate_coor_with_ship_length?(@submarine, ["A1", "A2"])
    assert @board.validate_coor_with_ship_length?(@cruiser, ["A1", "A2", "A4"])
    refute @board.validate_coor_with_ship_length?(@cruiser, ["A1", "A2"])
    refute @board.validate_coor_with_ship_length?(@submarine, ["A1", "A3", "A4"])
  end

  def test_if_coordinates_are_consecutive_submarine #method 3,passed

    refute @board.validate_ships_consecutive_for_cruiser?(@cruiser, ["A1", "A2", "A4"])
    assert @board.validate_ships_consecutive_for_cruiser?(@cruiser, ["A1","A2","A3"])
  end


  def test_if_coordinates_are_consecutive_cruiser #method 4,passed

    refute @board.validate_ships_consecutive_for_submarine?(@submarine, ["A1","C1"])
    assert @board.validate_ships_consecutive_for_submarine?(@submarine, ["B2","B3"])
  end

  def test_if_ships_overlap #method 5, passed

    @board.place(@cruiser, ["A1", "A2", "A3"])
    refute @board.validate_no_overlapping?(@submarine, ["A1", "B1"])
  end

  def test_we_can_place_ship #method 6, passed

    @board.place(@cruiser, ["A1", "A2", "A3"])
    @cell_1 = @board.cells["A1"]
    @cell_2 = @board.cells["A2"]
    @cell_3 = @board.cells["A3"]
    assert_equal @cruiser, @cell_1.ship
    assert_equal @cruiser, @cell_2.ship
    assert_equal @cruiser, @cell_3.ship
    assert @cell_3.ship == @cell_2.ship
  end



  def test_if_coordinates_are_diagonal

    refute @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    refute @board.validate_ships_consecutive_for_submarine?(@submarine, ["A1","B2"])
    refute @board.valid_placement?(@submarine, ["C2", "D3"])
  end

end #end class
