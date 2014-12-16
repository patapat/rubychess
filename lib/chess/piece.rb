
module Chess

  class Piece

    DIAGONAL_DIRECTIONS = [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ]
    ORTHOGONAL_DIRECTIONS = [
      [0, 1],
      [0, -1],
      [-1, 0],
      [1, 0]
    ]

    def initialize(symbol, icon, position, color, board)
      @symbol = symbol
      @icon = icon
      @position = position
      @color = color
      @board = board
    end

    def moves(offsets, positon)
      offsets.select do |x, y|
        [x, y] unless board[positon[0] + x][position[1] + y].nil?
      end
    end

  end



end
