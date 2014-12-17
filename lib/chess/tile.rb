module Chess
  class Tile
    attr_reader :value, :board
    attr_accessor :current_piece, :occupied

    def initialize(board)
      @value = ''
      @board = board
      @current_piece = ''
      @occupied = false
    end

    def occupied?
      @occupied
    end



  end
end
