require "byebug"
require_relative "piece.rb"
class Board
  attr_accessor :grid 
  def self.default
    @grid = Array.new(8) {Array.new(8)}
    @grid[1].map!.with_index {|el, i| Pawn.new(:white, @grid, [1, i])}
    @grid[6].map!.with_index {|el, i| Pawn.new(:black, @grid, [6, i])}
    @grid[0][0] = Rook.new(:white, @grid, [0, 0])
    @grid[0][7] = Rook.new(:white, @grid, [0, 7])
    @grid[7][0] = Rook.new(:black, @grid, [7, 0])
    @grid[7][7] = Rook.new(:black, @grid, [7, 7])
    @grid[0][2] = Bishop.new(:white, @grid, [0, 2])
    @grid[0][5] = Bishop.new(:white, @grid, [0, 5])
    @grid[7][2] = Bishop.new(:black, @grid, [7, 2])
    @grid[7][5] = Bishop.new(:black, @grid, [7, 5])
    @grid[0][4] = Queen.new(:white, @grid, [0, 4])
    @grid[7][4] = Queen.new(:black, @grid, [7, 4])
    @grid[0][3] = King.new(:white, @grid, [0, 3])
    @grid[7][3] = King.new(:black, @grid, [7, 3])
    @grid[0][1] = Knight.new(:white, @grid, [0, 1])
    @grid[0][6] = Knight.new(:white, @grid, [0, 6])
    @grid[7][1] = Knight.new(:black, @grid, [7, 1])
    @grid[7][6] = Knight.new(:black, @grid, [7, 6])   
    
    
    @grid
  end
  
  
  
  def initialize
    @grid = Board.default
    nil
  end
  
  def [](pos)
    @grid[pos[0]][pos[1]]
  end
  
  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
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
  
  def valid_pos?(pos)
    x, y = pos 
    return false if x < 0 || x > 7
    return false if y < 0 || y > 7
    true
  end
end