
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

    attr_reader :color, :symbol, :board
    attr_accessor :position

    def initialize(symbol, icon, position, color, board)
      @symbol = symbol
      @icon = icon
      @position = position
      @color = color
      @board = board
    end

    def inspect
      "#{@symbol}, #{@position}, #{@color}"
    end

    def moves(offsets, positon)
      offsets.select do |x, y|
        [x, y] unless board[positon[0] + x][position[1] + y].nil?
      end
    end

    def move_in_check(pos)
      # dup board
      # perform move
      # board in check
    end
  end
end
