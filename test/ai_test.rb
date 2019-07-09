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

          #has 2 ships by defualt,


          #has access to hash for targets,

          #test it can fire 16 times

          #test it can place valid ships randomly
