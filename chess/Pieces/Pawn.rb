require "byebug"
require_relative "Piece"

class Pawn < Piece 
  
  def symbol
    @color == :white ? '♙' : '♟'
  end
  
  def move_dirs
    arr = []
    if @color == :white
      arr << [1, 0] 
      arr << [2, 0] if at_start_row?
      arr += side_attacks
    else
      black = [-1, 0]
      arr << [-2, 0] if at_start_row?
      arr += side_attacks
    end 
    arr
  end
  
  def side_attacks
    # debugger
    arr = []
    if @color == :white
      arr << [1, 1] if @board[[@pos[0] +1, @pos[1] +1]].color == :black
      arr << [1, -1] if @board[[@pos[0] +1, @pos[1] -1]].color == :black
    else 
      arr << [-1, 1] if @board[[@pos[0] -1, @pos[1] +1]].color == :white
      arr << [-1, -1] if @board[[@pos[0] -1, @pos[1] -1]].color == :white
    end
      arr
  end
  
  def moves
    arr = []
    
    directin = move_dirs
    
    directin.each do |diff|
      new_pos = @pos.dup
      new_pos[0] += diff[0]
      new_pos[1] += diff[1]
      arr << new_pos if @board.valid_pos?(new_pos)
    end
    arr
  end
  
  def at_start_row?
    if @color == :white && @pos[0] == 1
      true
    elsif @color == :black && @pos[0] == 6
      true
    else
      false
    end
  end
  
end 