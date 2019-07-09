require './lib/ai'
require './lib/board'
require './lib/cell'
require './lib/ship'

class Game
  def initialize
    @ai_board = Board.new #board for ai
    @user_board  = Board.new #board for human player
    @ai   = Ai.new(@ai_board, @user_board)
    @user_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)] #user object starts with two ships
    @winner = nil
  end

  def start_up #method to call main menu and game setup methods
    main_menu #welcome message to see if user wants to play or quit
    play_setup #places ships randomly,user enters sequences to place both ships, recognize invalid ships
    turn #
    end_game
  end

  def main_menu
    print "-" * 10
    puts "B A T T L E S H I P"
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
      "You gave me #{user_input}...please enter a valid option."
    end
  end #end main menu method

  def play_setup
    @ai.place_ships #method in ai class to place ships
    puts "I have laid out my ships on the grid."
    puts "You now need tio lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    #end ai response, now player must place ships
    

  end #end play_setup

  def turn
  end

  def end_game
  end

end
