require_relative './sliding_piece.rb'

module Chess

  class Bishop < SlidingPiece

    def initialize(position, color, board)
      @symbol = :B
      @icon = "B"
      super(@symbol, @icon, position, color, board)
    end

    def move_dirs
      Piece::DIAGONAL_DIRECTIONS
    end

    def moves(@position, move_dirs)
      super
    end
  end

end
