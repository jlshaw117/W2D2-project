class Piece
  attr_reader :type, :move
  
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end
  
  def valid_moves
    true
  end
  
  def to_s
  end
  
  def pos=(val)
  end
  
  def symbol
  end
  
  private
  def move_into_check?(end_pos)
    
  end
end