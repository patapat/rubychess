module Chess

  class Piece

    def initialize(symbol, icon, position, color, board)
      @piece_type = symbol
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
