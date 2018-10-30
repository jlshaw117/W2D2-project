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
    # arr = Array.new(8) { Array.new(8) }
    @board.grid.each_with_index do |sub, j|
      puts "\n"
      sub.each_with_index do |piece, i|
        if cursor.cursor_pos == [j,i]
          print ' d '.colorize(background: :red)
        
        elsif j.even?
          if i.even?
            print ' E '.colorize(:color => :black, background: :green)
          else
            print ' O '.colorize(:color => :black).colorize(:background => :blue)
          end 
        else
          if i.odd?
            print ' E '.colorize(:color => :black, background: :green)
          else
            print ' O '.colorize(:color => :black).colorize(:background => :blue)
          end 
        end
      end
      
    end
    # if cursor.cursor_pos
    #   @board[@cursor.cursor_pos].colorize(background: :red)
    # end 
    nil
  end 
  
  def play
    
    while true
      system "clear"
      render
      @cursor.get_input
      p @cursor.cursor_pos
    end 
    
  end
  
end 

if __FILE__ == $PROGRAM_NAME
  b = Board.new 
  Display.new(b).play
  
  
end 