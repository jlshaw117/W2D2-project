require_relative "Piece"
require "singleton"

class NullPiece < Piece
  include Singleton
  
  attr_reader :color, :symbol
  
  def initialize
      @color, @symbol = nil, " " 
  end
  
end