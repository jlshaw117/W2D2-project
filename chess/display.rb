require 'colorize'
require_relative "cursor.rb"

class Display
  attr_accessor :cursor, :board
  
  def initialize#(board= 0)
    # @board = board
    # @cursor = Cursor.new([0,0], @board)
  end
  
  def render
    arr = Array.new(8) { Array.new(8) }
    arr.each do |sub|
      puts ""
      sub.each_with_index do |el, i|
          if i.even?
            print 'saf'.colorize(:color => :blue, :backgroud => :white)
          else
            print 'saf'.colorize(:color => :blue, :backgroud => :green)
          end 
          puts '-----'
      end
    end
  end 
  
end 