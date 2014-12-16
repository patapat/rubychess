require_relative '../piece.rb'

module Chess

  class SlidingPiece < Piece

    # Symbol denotes type i.e. (Queen, Rook, Bishop)
    def initialize(symbol, icon, position, color, board)
      super
    end

    def moves(position, directions) # returns an array of valid moves
      init_x, init_y = position
      returned_positions = []

      directions.each do |x, y|
        test_pos = [init_x + x, init_y + y]
        while board.valid_move?(self, test_pos)
          returned_positions << test_pos
          test_pos[0], test_pos[1] += x, y
        end
      end

      returned_positions
    end


  end
end
