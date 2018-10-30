require "singleton"
class Piece
  attr_reader :type, :move
  
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end
  
  def valid_move?(end_pos)
    true
  end
end

class Pawn < Piece
end
class Rook < Piece
end
class Knight < Piece
end
class Bishop < Piece
end
class King < Piece
end
class Queen < Piece
end
class NullPiece < Piece
  include Singleton
end