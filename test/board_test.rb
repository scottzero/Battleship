require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
  end

  def test_that_board_exists

    assert_instance_of Board, @board
  end

  def test_that_board_has_cells

   @board.cells
  end
end
