require_relative './sliding_piece.rb'

module Chess

  class Rook < SlidingPiece

    def initialize(position, color, board)
      @symbol = :R
      @icon = "R"
      super(@symbol, @icon, position, color, board)
    end

    def move_dirs
      Piece::ORTHOGONAL_DIRECTIONS
    end


    def moves(@position, move_dirs)
      super
    end

  end

end
