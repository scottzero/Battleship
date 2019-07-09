class Ai
  #TODO
##ai will be born with their own board and a userboard to fire upon "targets"
##ai will be born with 2 ships
##ai must reference a random pool of targets, coordinate hash
##methods: fire(targets?), method to update new targets after firing, place ships, #validate sampled coordinates
def initialize(ai_board, user_board)
  @ai_board = ai_board
  @user_board = user_board
  @targets = user_board.cells.keys.shuffle #randmizes potential targets for ai?
  @ai_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine",2 )]
end
end
