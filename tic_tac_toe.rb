class Player
  @player_one_presence = false

  def initialize
    if @player_one_presence == false
      puts "What is your name, player one?"
      @player_one = gets.chomp
      @player_one_presence = true
    else
      puts "What is your name, player one?"
      @player_two = gets.chomp
    end
  end
end

class Computer

  def initialize
    puts "Oh, hello there.\nI came to entertain you.\nI am the computer.\nNice to meet you.\n\n"
  end

  private
  def computer_choice
    random = rand 9
  end

  public
  def number_display
    puts computer_choice
  end
end

class Greetings

  def initialize
    system("clear")
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

module GameSymbol
  O = "O"
  X = "X"
end

class Game
  include GameSymbol
  @@times_played = 0

  attr_accessor :player_one
  attr_accessor :player_two

  def initialize(game_mode = s)
    system("clear")
    @game_mode = game_mode
    @@times_played += 1
    if game_mode == 's'
      single_player
    elsif game_mode == 'm'
      multi_player
    else
      system("clear")
      puts "You have to choose between a valid game mode"
      Greetings.initialize
      new_choice = gets.chomp
      initialize new_choice
    end
  end

  private
  def single_player
    @computer = Computer.new
    @player_one = Player.new 
  end

  private 
  def multi_player game_mode
    if game_mode == m
      player_one = Player.new
      player_two = Player.new
    end
  end

  public
  def game_board player = @player_one
    system("clear")
    puts "|_|_|_|\n
|_|_|_|\n
|_|_|_|\n
Please enter a valid number from one to nine to mark the spot #{player}"
  end

  def start 
    game_board @player_one
    if @player_two
      game_board @player_two
    else
      gameboard "computer"
    end
  end
end



message = Greetings.new
game_mode = gets.chomp
round_one = Game.new game_mode
