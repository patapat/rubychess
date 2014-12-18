require 'colorize'
require 'byebug'

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
require_relative "./chess/game.rb"
require_relative "./chess/player.rb"





module Chess

  class InvalidMoveError < ArgumentError
  end
  
end


Chess::Game.start(Chess::Game.prompt_player)
