require_relative "Piece"
require_relative "Sliding"

class Bishop < Piece 
  
  include SlidingPiece
  
  def symbol
    @color == :white ? '♗' : '♝'
  end 
  
  def move_dirs
    diagonal
  end 
  
end 