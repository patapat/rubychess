module Chess
  class Board
    def initialize
      @grid = Array.new(8) { Array.new(8) { Tile.new } }

    end

    # Return true unless board position doesn't exist or tile is occupied by piece of same color.
    def valid_move?(piece, position)
       return true unless @grid[position].nil? or return_piece_on_tile(position).color == piece.color
    end

    def return_piece_on_tile(position)
      tile.current_piece
    end

    def get_position(pos)
      x, y = pos
      @grid[x][y]
    end
  end
end
