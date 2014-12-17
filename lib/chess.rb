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

class String
  def black;          "\033[30m#{self}\033[0m" end
  def red;            "\033[31m#{self}\033[0m" end
  def green;          "\033[32m#{self}\033[0m" end
  def brown;          "\033[33m#{self}\033[0m" end
  def blue;           "\033[34m#{self}\033[0m" end
  def magenta;        "\033[35m#{self}\033[0m" end
  def cyan;           "\033[36m#{self}\033[0m" end
  def gray;           "\033[37m#{self}\033[0m" end
  def bg_black;       "\033[40m#{self}\033[0m" end
  def bg_red;         "\033[41m#{self}\033[0m" end
  def bg_green;       "\033[42m#{self}\033[0m" end
  def bg_brown;       "\033[43m#{self}\033[0m" end
  def bg_blue;        "\033[44m#{self}\033[0m" end
  def bg_magenta;     "\033[45m#{self}\033[0m" end
  def bg_cyan;        "\033[46m#{self}\033[0m" end
  def bg_gray;        "\033[47m#{self}\033[0m" end
  def bold;           "\033[1m#{self}\033[22m" end
  def reverse_color;  "\033[7m#{self}\033[27m" end
end



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

b.move([6, 5], [5, 5])
b.move([1, 4], [3, 4])
b.move([6, 6], [4, 6])
b.move([0, 3], [4, 7])
p b.checkmate?(:W)
p b.in_check?(:W)

b.render
