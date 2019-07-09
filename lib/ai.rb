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

  def validate_sampled_coordinates
    #TODO: should access sampled coordinate values from hash keys
    #and validate they match the ai_ships? 
  end

  def place_ship_ai
    #TODO: accesses computer ships, and for each one
    #validates a random set of coordinates and calls place ship method
  end

  def targets
    #TODO: should have access to possible targets and update them,
    #if an array could remove targets that are no long feasible
  end

  def fire_at_targets(targets)
    #TODO: needs to access player_board, passing targets, then call fire upon
  end

end #end class
