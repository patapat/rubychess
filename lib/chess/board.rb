

module Chess


  class Board
    attr_reader :board, :grid, :current_pieces

    PIECES_EACH_COLOR = [:P, :P, :P, :P, :P, :P, :P, :P, :R, :R, :B, :B, :N, :N, :Q, :K]
    WHITE_STARTING_POSITIONS = [[6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7],
                                [7, 0], [7, 7], [7, 2], [7, 5], [7, 1], [7, 6], [7, 3], [7, 4]]
    BLACK_STARTING_POSITIONS = [[1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7],
                                [0, 0], [0, 7], [0, 2], [0, 5], [0, 1], [0, 6], [0, 3], [0, 4]]

    def initialize
      @grid = Array.new(8) { Array.new(8) { Tile.new(self) } }
      @current_pieces = { W: [], B: [] }
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

    def generate_start_board
      colors = [:W, :B]
      colors.each do |color|
        start_poss = (color == :W ? WHITE_STARTING_POSITIONS : BLACK_STARTING_POSITIONS)
        PIECES_EACH_COLOR.each_with_index do |piece, i|
          pos = start_poss[i]
          tile = get_position(pos)
          case piece
          when :P
            tile.current_piece = Chess::Pawn.new(pos, color, self)
          when :R
            tile.current_piece = Chess::Rook.new(pos, color, self)
          when :B
            tile.current_piece = Chess::Bishop.new(pos, color, self)
          when :N
            tile.current_piece = Chess::Knight.new(pos, color, self)
          when :Q
            tile.current_piece = Chess::Queen.new(pos, color, self)
          when :K
            tile.current_piece = Chess::King.new(pos, color, self)
          end
          @current_pieces[color] << tile.current_piece
        end
      end
    end

    def in_check?(color)

    end

    def move(start, fin) #return coordinates
      get piece at start

      move logic(
                  reassign piece (update location)
                  reassign start tile (wiping current position)
                  if an attack occurred
                    reassign end tile 
      )

    end

  end
end
