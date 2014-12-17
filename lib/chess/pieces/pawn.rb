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
        return WHITE_PAWN_MOVES
      else
        return BLACK_PAWN_MOVES
      end
    end

    def pawn_valid_move?(arr)
      return

    end

    def moved?
      if color == :W && position[0] == 6
        return false
      elsif color == :B && position[0] == 1
        return false
      end
      true
    end

    def moves # array of possible moves

      move_dirs[:vertical_moves].pop if moved?
      init_x, init_y = @position
      returned_moves = []
      first_pos = [init_x + move_dirs[:vertical_moves][0][0], init_y]
      #separate into methods

      move_dirs[:vertical_moves].each do |x, y|
        dir = [init_x + x, init_y]
        unless board.get_position(dir).nil?
          returned_moves << dir if board.valid_move?(self, first_pos) &&
            @board.valid_move?(self, dir)
        end
      end

      move_dirs[:diagonal_moves].each do |x, y|
        dir = [init_x + x, init_y + y]
        unless board.get_position(dir).nil?
          returned_moves << dir if board.get_position(dir).occupied? &&
            board.get_position(dir).current_piece.color != self.color
        end
      end
      returned_moves
    end

  end
end
