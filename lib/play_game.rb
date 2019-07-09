require './lib/computer'
require './lib/board'
require './lib/cell'
require './lib/ship'

class Game
  def initialize
    @ai_board = Board.new
    @user_board  = Board.new
    @ai   = Computer.new(@ai_board, @user_board)
    @user_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
    @winner = nil
  end
  def main_menu
    print "-" * 10
    puts "B A T T L E S H I P "
    print "-" * 10
    puts "Enter play to play OR Enter quit to quit:"
    user_input = gets.chomp.downcase
    print "\n" * 2

  case user_input
when "play"
  "Time to start the game."
when "quit"
  "Hope to see you play next time, quitting game..."
else
  "You gave me #{user_input} -- I have no idea what to do with that."
end
