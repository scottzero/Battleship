require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

class CellTest < Minitest::Test
  def setup
    @cell = Cell.new("B4")
    # @cruiser = Ship.new("Cruiser", 3)
  end

  def test_that_cell_exists

    assert_instance_of Cell, @cell
  end

  def test_to_show_coordinate

    assert_equal "B4", @cell.coordinate
  end

  def test_to_show_ship_value_is_nil

    assert_nil @cell.ship
  end

  def test_to_show_cell_is_empty

    assert_equal true, @cell.empty?
  end
end
