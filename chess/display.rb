require 'colorize'
require_relative "cursor.rb"
require_relative "board.rb"

class Display
  attr_accessor :cursor, :board
  
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], @board)
    nil
  end
  
  def render
    system "clear"
    @board.grid.each_with_index do |sub, j|
      puts "\n"
      sub.each_with_index do |piece, i|
        if cursor.cursor_pos == [j,i]
          print @board[[j, i]].to_s.colorize(background: :red)
        
        elsif j.even?
          if i.even?
            print @board[[j, i]].to_s.colorize( background: :green)
          else
            print @board[[j, i]].to_s.colorize(:background => :blue)
          end 
        else
          if i.odd?
            print @board[[j, i]].to_s.colorize(background: :green)
          else
            print @board[[j, i]].to_s.colorize(:background => :blue)
          end 
        end
      end
      
    end
  
    nil
  end 
  
  def play
    
    while true
      render
      start_pos = nil
      until start_pos
        start_pos = @cursor.get_input
        render
      end 
      start_pos
      end_pos = nil
      
      until end_pos
        end_pos = @cursor.get_input
        render
      end
      @board.move_piece(start_pos, end_pos)
    end 
  end
end 

if __FILE__ == $PROGRAM_NAME
  b = Board.new 
  Display.new(b).play
  
  
end 