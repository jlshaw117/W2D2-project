require_relative "Piece"
require_relative "Sliding"

class Rook < Piece 
  
  include SlidingPiece
  
  def symbol
    @color == :white ? '♖' : '♜'
  end 
  
  def move_dirs
    horizontal
  end 
  
end 