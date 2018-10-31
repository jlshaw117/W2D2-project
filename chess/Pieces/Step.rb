module SteppingPiece
  
  def moves
    arr = []
    directions = move_diffs
    directions.each do |dir|
      
      new_pos = @pos.dup
      new_pos[0] += dir[0]
      new_pos[1] += dir[1]
      
      arr << new_pos
        
    end
    arr.reject! {|pos| @board[pos].color == @color}
    arr.select {|pos| @board.valid_pos?(pos)}
  end
  
  
end 