require_relative "Piece"
require_relative "Step"

class King < Piece 
  
  include SteppingPiece
  
  def symbol
    @color == :white ? '♔' : '♚'
  end 
  
  def move_diffs
    [[1, 1], [-1, -1], [0, -1], [0, 1], [1, 0], [-1, 0], [-1, 1], [1, -1]]
  end 
  
  
  
end 