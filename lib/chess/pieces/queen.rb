require_relative './sliding_piece.rb'

module Chess

  class Queen < SlidingPiece

    def initialize(position, color, board)
      @symbol = :Q
      @icon = "Q"
      super(@symbol, @icon, position, color, board)
    end

    def move_dirs
      Piece::ORTHOGONAL_DIRECTIONS + Piece::DIAGONAL_DIRECTIONS
    end

    def moves(@position, move_dirs)
      super
    end

  end

end
