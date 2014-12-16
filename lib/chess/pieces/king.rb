require_relative './stepping_piece.rb'

module Chess

  class King < SteppingPiece

    def initialize(position, color, board)
      @symbol = :K
      @icon = "K"
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
