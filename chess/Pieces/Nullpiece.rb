require_relative "Piece"
require "singleton"

class NullPiece < Piece
  include Singleton
end