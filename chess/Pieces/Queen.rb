require_relative "Piece"
require_relative "Sliding"

class Queen < Piece
  
  include SlidingPiece
  
  def move_dirs 
    diagonal + horizontal
  end
  
  def symbol
    @color == :white ? '♕' : '♛'
  end
  
end 