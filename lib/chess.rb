
require_relative "./chess/tile.rb"
require_relative "./chess/piece.rb"
require_relative "./chess/board.rb"
require_relative "./chess/pieces/bishop.rb"
require_relative "./chess/pieces/king.rb"
require_relative "./chess/pieces/knight.rb"
require_relative "./chess/pieces/pawn.rb"
require_relative "./chess/pieces/queen.rb"
require_relative "./chess/pieces/rook.rb"
require_relative "./chess/pieces/sliding_piece.rb"
require_relative "./chess/pieces/stepping_piece.rb"



module Chess

  class InvalidMoveError < ArgumentError
    # def initialize(message)
    #   @message = 'Please select a valid move!'
    # end
  end
  # Your code goes here...
end


b = Chess::Board.new
b.generate_start_board

b.move([6, 0], [4, 0])
p b.piece_on_tile([6, 0])
p b.piece_on_tile([4, 0])
b.move([7, 1], [5, 2])
p b.piece_on_tile([5, 2])
p b.piece_on_tile([7, 1])
