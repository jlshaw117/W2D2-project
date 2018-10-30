module SlidingPiece
  attr_reader :
  
   DIRECTIONS {
     :horizontal => [[0,1], [0,-1], [1,0], [-1,0]],
     :diagonal => [[1, 1], [-1, -1], [-1, 1], [1, -1]]
   }
   
   def horizontal
     DIRECTIONS[:horizontal]
   end
   
   def diagonal
     DIRECTIONS[:diagonal]
   end

  def move_dirs 
    raise "I need to make this!!"
  end
  
  def moves
    arr = []
    value = move_dirs
    value.each do |diff|
      new_positions = @pos.dup
        until @board[new_positions].class != NullPiece
          arr << new_positions
        end
    end
    arr
  end  
end