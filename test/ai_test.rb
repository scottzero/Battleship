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
  end

  #TODO:

#tests for validation of existence,

  def test_ai_exists

  end
#has 2 ships by defualt,
  def test_ai_has_2_ships

  end

#has access to hash for targets,
  def test_it_has_hash_count_of_targets_to_fire_upon

  end

#test it can fire 16 times
  def test_it_can_fire_at_the_hash_coordinate_count_times

  end
#test it can place valid ships randomly
  def test_it_can_validate_sample_coords_for_ship_placement
  end

end #end test 
