require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

class CellTest < Minitest::Test
  def setup
    @cell = Cell.new("B4")
    @ship_1 = Ship.new("Cruiser",3)
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

  def test_that_cruiser_exists
    assert_instance_of Ship, @ship_1
  end

  def test_cell_has_ship
    @cell.place_ship(@ship_1)
    assert_instance_of Ship, @cell.ship
  end

  def test_is_cell_is_not_empty_now
    @cell.place_ship(@ship_1)
    assert_equal false, @cell.empty?
    refute @cell.empty?
  end

  def test_cell_is_not_fired_upon_yet
    @cell.place_ship(@ship_1)

    assert_equal false, @cell.fired_upon?
    refute @cell.fired_upon?
  end

  def test_cell_has_been_fired_upon
    @cell.place_ship(@ship_1)
    refute @cell.fired_upon?
    @cell.fire_upon
    assert_equal 2, @cell.ship.health
    assert @cell.fired_upon?
  end

end
