require 'pry'

class Game
  attr_accessor :last_player

  WIN_CONDITIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  def initialize
    $board = Board.new
    $player_1 = Player.new("x")
    $player_2 = Player.new("o")
    @last_player = "o"
  end

  def play_a_round
    if self.last_player == "x"
      puts "Select a space to mark as 'o'"
      selection = gets.chomp.to_i
      $board.change_spaces("o", selection)
    else
      puts "Select a space to mark as 'x'"
      selection = gets.chomp.to_i
      $board.change_spaces("x", selection)
    end
  end
end

class Board
  attr_accessor :spaces

  def initialize
    @spaces = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    show_board
  end
  
  def change_spaces(player, space)
    if @spaces[space] == " "
     @spaces[space] = player
    elsif space > 8 || space < 0
      puts "The entered space is not valid"
      return
    else
      puts "The space was already selected"
      return
    end
    $game.last_player = player
    self.show_board
  end

  def game_is_won?(player)
    is_won = false
    for i in Game::WIN_CONDITIONS do
      if i.all? do |number|
        self.spaces[number] == player
      end
        is_won = true
        break
      end
    end
    is_won
  end

  def show_board
    puts @spaces[0] + "|" + @spaces[1] + "|" + @spaces[2]
    puts "-----"
    puts @spaces[3] + "|" + @spaces[4] + "|" + @spaces[5]
    puts "-----"
    puts @spaces[6] + "|" + @spaces[7] + "|" + @spaces[8]
  end

end

class Player
  def initialize(player_symbol)
    @symbol = player_symbol
  end
end

$game = Game.new

def play_game
  is_won = false
  until is_won do
    $game.play_a_round
    if $board.game_is_won?($game.last_player)
      puts "#{$game.last_player} won the game!"
      is_won = true
    end
    if $board.spaces.all? { |space| space != " " }
      puts "Nobody won"
      return
    end
  end
end

play_game
