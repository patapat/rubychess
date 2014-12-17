require_relative '../piece.rb'

module Chess

  class Pawn < Piece
    BLACK_PAWN_MOVES = {
      vertical_moves: [[1, 0], [2, 0]],
      diagonal_moves: [[1,-1], [1, 1]]
    }

    WHITE_PAWN_MOVES = {
      vertical_moves: [[-1, 0], [-2, 0]],
      diagonal_moves: [[-1,-1], [-1, 1]]
    }

    def initialize(position, color, board)
      @symbol = :P
      @icon = "P"
      super(@symbol, @icon, position, color, board)
      @moved = false
    end

    def move_dirs
      if @color == :W
        WHITE_PAWN_MOVES
      else
        BLACK_PAWN_MOVES
      end
    end

    def pawn_valid_move?(arr)
      return

    end

    def moves(move_dirs) # array of possible moves
      move_dirs[0].pop unless @moved
      init_x, init_y = @position
      returned_moves = []
      first_pos = [init_x + move_dirs[0][0], init_y]
      move_dirs[:vertical_moves].each do |x, y|
        dir = [init_x + x, init_y]
        returned_moves << dir if @board.valid_move?(self, first_pos) &&
          @board.valid_move?(self, dir)
      end

      move_dirs[:diagonal_moves].each do |x, y|
        dir = [init_x + x, init_y + y]
        returned_moves << dir if board.get_position(dir).occupied? &&
          board.get_position(dir).current_piece.color != self.color
      end




      returned_moves
    end

  end
end
