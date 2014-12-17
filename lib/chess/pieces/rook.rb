require_relative './sliding_piece.rb'

module Chess

  class Rook < SlidingPiece

    def initialize(position, color, board)
      color == :W ? @icon = "\u265C".encode("UTF-8") : @icon = "\u2656".encode("UTF-8")
      @symbol = :R
      super(@symbol, @icon, position, color, board)
    end

    def move_dirs
      Piece::ORTHOGONAL_DIRECTIONS
    end


    def moves
      super(@position, move_dirs)
    end

  end

end
