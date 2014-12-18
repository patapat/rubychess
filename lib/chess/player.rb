require 'byebug'

module Chess

  class HumanPlayer
    attr_reader :name, :symbol_color

    def initialize(name, symbol_color)
      @name = name
      @symbol_color = symbol_color
    end
  end

  class ComputerPlayer
    attr_reader :name, :symbol_color, :board

    def initialize(name = "Computron-#{(1..10000).to_a.sample}", symbol_color, board)
      @name = name
      @symbol_color = symbol_color
      @board = board
    end

    def random_moves
      moves = Hash.new {|h, k| h[k] = []}
      board.current_pieces[symbol_color].each do |piece|
        moves[piece.position] += piece.valid_moves(piece.moves)
      end
      chosen_piece = moves.keys.sample
      chosen_move = moves[chosen_piece].sample
      @board.move(chosen_piece, chosen_move)
    end
  end
end
