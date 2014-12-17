require_relative './sliding_piece.rb'

module Chess

  class Queen < SlidingPiece

    def initialize(position, color, board)
      color == :W ? @icon = "\u265B".encode("UTF-8") : @icon = "\u2655".encode("UTF-8")
      @symbol = :Q
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
