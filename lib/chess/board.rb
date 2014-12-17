require 'byebug'

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
       return false if get_position(position).nil?
       return true if piece_on_tile(position) == ''
       return false if piece_on_tile(position).color == piece.color
    end

    def piece_on_tile(position)
      get_position(position).current_piece
    end

    def get_position(pos)
      x, y = pos
      return nil if ((x > 7 || x < 0) || (y > 7 || y < 0))
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
            tile.current_piece = Pawn.new(pos, color, self)
          when :R
            tile.current_piece = Rook.new(pos, color, self)
          when :B
            tile.current_piece = Bishop.new(pos, color, self)
          when :N
            tile.current_piece = Knight.new(pos, color, self)
          when :Q
            tile.current_piece = Queen.new(pos, color, self)
          when :K
            tile.current_piece = King.new(pos, color, self)
          end
          @current_pieces[color] << tile.current_piece
          tile.occupied = true
        end
      end
    end

    def in_check?(color)
      king = current_pieces[color].select do |piece|
        piece.symbol == :K
      end
      king = king[0]

      opp_color = (color == :W ? :B : :W)
      current_pieces[opp_color].none? do |piece|
        piece.moves.include?(king.position)
      end

      b.current_pieces[:B].none? do |piece|
        piece.moves.include?(a.position)
      end
    end


    def move(start, dest) #return coordinates
      start_piece = piece_on_tile(start)
      debugger
      if start_piece.moves.include?(dest)

        tile = get_position(dest)
        if tile.occupied?
          end_piece = tile.current_piece
          @current_pieces[end_piece.color].delete(end_piece)
        end
        tile.current_piece = start_piece
        tile.occupied = true
        start_piece.position = dest
        get_position(start).current_piece = ""
        get_position(start).occupied = false
      else
        raise InvalidMoveError.new "Please select a valid move"
      end
    end

    def deep_dup(grid)
      grid.inject([]) do |dup, el|
        dup << (el.is_a?(Array) ? deep_dup(el) : el)
      end
    end



  end
end
