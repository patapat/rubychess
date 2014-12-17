require_relative './stepping_piece.rb'

module Chess

  class Knight < SteppingPiece
    KNIGHT_MOVES = [
      [2,  -1],
      [2,   1],
      [1,   2],
      [1,  -2],
      [-1,  2],
      [-1, -2],
      [-2, -1],
      [-2,  1]
    ]

    def initialize(position, color, board)
      @symbol = :N
      @icon = "N"
      super(@symbol, @icon, position, color, board)
    end

    def move_dirs
      KNIGHT_MOVES
    end

    def moves
      super(@position, move_dirs)
    end

  end
end
