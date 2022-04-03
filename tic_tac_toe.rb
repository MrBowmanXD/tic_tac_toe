module GameSymbol
  O = "O"
  X = "X"
end

class Game
  include GameSymbol
  @@times_played = 0

  attr_accessor :player_one
  attr_accessor :player_two

  def initialize(game_mode, player_one = "Nigga 1", player_two = "Nigga 2")
    @game_mode = game_mode
    @player_one = player_one
    @player_two = player_two
    @@times_played += 1
  end

  public
  def game_board player = @player_one
    system("clear")
    puts "|_|_|_|\n
|_|_|_|\n
|_|_|_|\n
Please enter a valid number from one to nine to mark the spot #{player}"
  end
end

class Greetings

  def initialize
    puts "Welcome to my game of tic-tac-toe\n
    Please choose:\n
    s) Singleplayer\n
    m) Multiplayer\n"
  end

  def player_one
    puts "What is your name player one?"
  end

  def player_two
    puts "What is your name player two?"
  end
  
end

message = Greetings.new
game_mode = gets.chomp
round_one = Game.new(game_mode)
round_one.game_board(round_one.player_one)
