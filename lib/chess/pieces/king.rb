require_relative './stepping_piece.rb'

module Chess

  class King < SteppingPiece

    def initialize(position, color, board)
      color == :W ? @icon = "\u265A".encode("UTF-8") : @icon = "\u2654".encode("UTF-8")
      @symbol = :K

      super(@symbol, @icon, position, color, board)
    end

    def move_dirs
      Piece::ORTHOGONAL_DIRECTIONS + Piece::DIAGONAL_DIRECTIONS
    end

    def moves
      super(@position, move_dirs)
    end

  end
end
