class Player
  @player_one_presence = false
  attr_accessor :player_one
  attr_accessor :player_two

  def initialize
    if @player_one_presence == false
      puts "\nWhat is your name, player one?\n"
      @player_one = gets.chomp
      @player_one_presence = true
    else
      puts "\nWhat is your name, player two?\n"
      @player_two = gets.chomp
    end
  end
end

class Computer

  def initialize
    puts "Oh, hello there.\n\nI came to entertain you.\n\nI am the computer.\n\nNice to meet you.\n\n"
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

module Greetings

  def initial_response
    system("clear")
    puts "Welcome to my game of tic-tac-toe\n
    Please choose:\n
    s) Singleplayer\n
    m) Multiplayer\n\n"
  end

  def player_one
    puts "\nWhat is your name player one?\n"
  end

  def player_two
    puts "\nWhat is your name player two?\n"
  end
  
end

module GameSymbol
  O = "O"
  X = "X"
end

class Game
  include Greetings
  include GameSymbol
  @@times_played = 0

  attr_accessor :player_one_name
  attr_accessor :player_two_name
  attr_accessor :game_board_array

  def initialize
    initial_response
    @game_board_array = Array.new(9, ' ')
  end

  def start_game game_mode
    system("clear")
    @game_mode = game_mode
    @@times_played += 1
    if @game_mode == 's'
      single_player
    elsif @game_mode == 'm'
      multi_player
    else
      system("clear")
      puts "You have to choose between a valid game mode"
      initial_response 
      new_choice = gets.chomp
      initialize new_choice
    end
  end

  private
  def single_player
    @computer = Computer.new
    @player_one = Player.new 
    @player_one_name = @player_one.player_one
  end

  private 
  def multi_player
    @player_one = Player.new
    @player_one_name = @player_one.player_one
    @player_two = Player.new
    @player_two_name = @player_two.player_two
  end

  private
  def player_choice number, player
    if number.to_i >= 0 && number.to_i < 9
      @game_board_array[number.to_i] = 'X' if player == @player_one_name
      @game_board_array[number.to_i] = 'O' if player == @player_two_name || player == 'Computer'
    end
  end

  private
  def check_win symbol
     
  end

  public
  def chosen_number number, player
    player_choice number, player
  end


  public
  def game_board player = @player_one, game_board_array = @game_board_array
    system("clear")
    puts "| #{@game_board_array[0]} | #{@game_board_array[1]} | #{@game_board_array[2]} |\n"
    puts "-------------\n"
    puts "| #{@game_board_array[3]} | #{@game_board_array[4]} | #{@game_board_array[5]} |\n"
    puts "-------------\n"
    puts "| #{@game_board_array[6]} | #{@game_board_array[7]} | #{@game_board_array[8]} |\n\n"
    puts "Please enter a valid number from zero to eight to mark the spot #{player}"
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

round_one = Game.new 
game_mode = gets.chomp
round_one.start_game game_mode
round_one.game_board round_one.player_one_name, round_one.game_board_array
x_marks_the_spot = gets.chomp
round_one.chosen_number x_marks_the_spot, round_one.player_one_name
round_one.game_board round_one.player_two_name, round_one.game_board_array
o_marks_the_spot = gets.chomp
round_one.chosen_number o_marks_the_spot, round_one.player_two_name
round_one.game_board round_one.player_one_name, round_one.game_board_array