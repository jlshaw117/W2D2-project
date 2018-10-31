class Piece
  attr_reader :color, :pos ,:board
  
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end
  
  def valid_move?(end_pos)
    moves.include?(end_pos)
  end
  
  def to_s
    " #{symbol} "
  end
  
  def pos=(val)
    @pos = val
  end
  
  def symbol
  end
  
  private
  def move_into_check?(end_pos)
    
  end
end