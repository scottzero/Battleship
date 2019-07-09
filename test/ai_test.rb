require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/ai'

class AiTest < MiniTest::Test

  def setup
    @ai_board = Board.new
    @user_board = Board.new
    @ai = Ai.new(@ai_board, @user_board)
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Cruiser", 3)
  end

  #TODO:

#tests for validation of existence,

  def test_ai_exists
    skip

  end

  def test_ai_has_a_board_rendered

    assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n", @ai_board.render
  end
#has 2 ships by defualt,
  def test_ai_has_1_ship
    @ai.place_cruiser_ai(@ai_board)

    assert_equal "  1 2 3 4 \nA S . S S \nB . . . . \nC . . . . \nD . . . . \n", @ai_board.render(true)
  end

  def test_ai_has_2_ships
    skip

  end

#has access to hash for targets,
  def test_it_has_hash_count_of_targets_to_fire_upon
    skip

  end

#test it can fire 16 times
  def test_it_can_fire_at_the_hash_coordinate_count_times
    skip

  end
#test it can place valid ships randomly
  def test_it_can_validate_sample_coords_for_ship_placement
    skip
  end

end #end test
