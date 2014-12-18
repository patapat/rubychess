require 'byebug'
require 'yaml'
require 'io/console'
require 'colorize'

module Chess

  class Game


    def self.start(arr_of_players)
      @game_board = Chess::Board.new
      @game_board.generate_start_board
      white_player, black_player = arr_of_players
      current_player = white_player
      until @game_board.checkmate?(:W) || @game_board.checkmate?(:B)
        # self.kb_user_input(@game_board)
        current_player == white_player ? (puts "White's move") : (puts "Black's move")
        begin
          play_move(@game_board, current_player)
        rescue
          system("clear")
          puts "Not your piece"
          retry
        end
        system("clear")
        current_player == white_player ? (current_player = black_player) : (current_player = white_player)
      end
      @game_board.render
      @game_board.checkmate?(:W) ? (puts "#{black_player.name.capitalize} Wins") : (puts "#{white_player.name.capitalize} Wins")
    end

    def self.kb_user_input(current_pos = [0,0], board)
      system('clear')
      board.render_cursor(current_pos)
      input = STDIN.getch

      unless input == "\r"
        system('clear')
        case input
        when 'w'
          current_pos[0] -= 1 if current_pos[0].between?(1,7)
        when 'a'
          current_pos[1] -= 1 if current_pos[1].between?(1,7)
        when 's'
          current_pos[0] += 1 if current_pos[0].between?(0,6)
        when 'd'
          current_pos[1] += 1 if current_pos[1].between?(0,6)
        end

        self.kb_user_input(current_pos, board)
      end

      system('clear')
      current_pos
    end


    def self.prompt_player # returns array of players
      puts "Would you like to (l)oad or play a (n)ew game?"
      game_state = gets.chomp
      if game_state == 'n'
        puts "Do you want play vs a (h)uman or a (c)omputer"
        response = gets.chomp
        if response == 'h'
          puts "Who will play as white? (enter name)"
          name1 = gets.chomp
          player1 = Player.new(name1, :W)
          puts "What is the other player's name?"
          name2 = gets.chomp
          player2 = Player.new(name2, :B)
        end
      end
      [player1, player2]
    end



    def self.play_move(board, player)
      begin
        origin = self.kb_user_input(board)
        dest = self.kb_user_input(origin.dup, board)
        if board.piece_on_tile(origin).color != player.symbol_color
          raise "Not player's Piece"
        end
        board.move(origin, dest)
      rescue ArgumentError
        system("clear")
        puts "Not a valid move"
        board.render
        retry
      end
    end

  end
end
