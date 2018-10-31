require "byebug"
require_relative "piece.rb"
class Board
  attr_accessor :grid 

  def initialize
    @grid = Array.new(8) {Array.new(8)}
    @grid[1].map!.with_index {|el, i| Pawn.new(:white, self, [1, i])}
    @grid[6].map!.with_index {|el, i| Pawn.new(:black, self, [6, i])}
    @grid[0][0] = Rook.new(:white, self, [0, 0])
    @grid[0][7] = Rook.new(:white, self, [0, 7])
    @grid[7][0] = Rook.new(:black, self, [7, 0])
    @grid[7][7] = Rook.new(:black, self, [7, 7])
    @grid[0][2] = Bishop.new(:white, self, [0, 2])
    @grid[0][5] = Bishop.new(:white, self, [0, 5])
    @grid[7][2] = Bishop.new(:black, self, [7, 2])
    @grid[7][5] = Bishop.new(:black, self, [7, 5])
    @grid[0][4] = Queen.new(:white, self, [0, 4])
    @grid[7][4] = Queen.new(:black, self, [7, 4])
    @grid[0][3] = King.new(:white, self, [0, 3])
    @grid[7][3] = King.new(:black, self, [7, 3])
    @grid[0][1] = Knight.new(:white, self, [0, 1])
    @grid[0][6] = Knight.new(:white, self, [0, 6])
    @grid[7][1] = Knight.new(:black, self, [7, 1])
    @grid[7][6] = Knight.new(:black, self, [7, 6])
    (2..5).each do |row|
      (0..7).each do |i|
        @grid[row][i] = NullPiece.instance
      end
    end   
    # (0 .. 7).each do |row|
    #   (0..7).each do |col|
    #     @grid[row][col] = NullPiece.instance
    #   end 
    # end 
    # 
    # @grid[4][4] = Queen.new(:white, self, [4,4])
  end
  
  def [](pos)
    @grid[pos[0]][pos[1]]
  end
  
  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
  end
  
  def move_piece(start_pos, end_pos)
    debugger
    piece = self[start_pos]
    unless piece && piece.valid_move?(end_pos)
      raise StandardError
    else
      self[end_pos] = piece
      piece.pos = end_pos
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