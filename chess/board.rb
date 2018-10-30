require "byebug"
require_relative "piece.rb"
class Board
  attr_accessor :board 
  def self.default
    @board = Array.new(8) {Array.new(8)}
    @board[1].map!.with_index {|el, i| Pawn.new(:white, @board, [1, i])}
    @board[6].map!.with_index {|el, i| Pawn.new(:black, @board, [6, i])}
    @board[0][0] = Rook.new(:white, @board, [0, 0])
    @board[0][7] = Rook.new(:white, @board, [0, 7])
    @board[7][0] = Rook.new(:black, @board, [7, 0])
    @board[7][7] = Rook.new(:black, @board, [7, 7])
    @board[0][2] = Bishop.new(:white, @board, [0, 2])
    @board[0][5] = Bishop.new(:white, @board, [0, 5])
    @board[7][2] = Bishop.new(:black, @board, [7, 2])
    @board[7][5] = Bishop.new(:black, @board, [7, 5])
    @board[0][4] = Queen.new(:white, @board, [0, 4])
    @board[7][4] = Queen.new(:black, @board, [7, 4])
    @board[0][3] = King.new(:white, @board, [0, 3])
    @board[7][3] = King.new(:black, @board, [7, 3])
    @board[0][1] = Knight.new(:white, @board, [0, 1])
    @board[0][6] = Knight.new(:white, @board, [0, 6])
    @board[7][1] = Knight.new(:black, @board, [7, 1])
    @board[7][6] = Knight.new(:black, @board, [7, 6])    
    
    @board
  end
  
  def initialize
    @board = Board.default
  end
  
  def [](pos)
    @board[pos[0]][pos[1]]
  end
  
  def []=(pos, value)
    @board[pos[0]][pos[1]] = value
  end
  
  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    unless piece && piece.valid_move?(end_pos)
      raise StandardError
    else
      self[end_pos] = piece
      debugger
      self[start_pos] = NullPiece.instance
    end
  end  
end