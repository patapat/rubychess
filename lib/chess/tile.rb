module Chess
  class Tile
    attr_reader :value
    attr_accessor :current_piece, :occupied

    def initialize(board)
      @value = ''
      @board = board
      @current_piece = ''
      @occupied = false
    end
  end
end
