require 'colerize'
require_relative "cursor.rb"

class Display
  attr_accessor :cursor, :board
  
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end
end 