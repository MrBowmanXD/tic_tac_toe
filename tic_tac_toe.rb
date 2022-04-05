class Player
  @player_one_presence = false
  attr_accessor :player_one
  attr_accessor :player_two

  def initialize
      puts "\nWhat is your name, player one?\n"
      @player_one = gets.chomp
      @player_one_presence = true
    if @player_one_presence == true
      puts "\nWhat is your name, player two?\n"
      @player_two = gets.chomp
    end
  end
end

class Computer

  def initialize
    puts "Oh, hello there.\n"
    puts "\nI came to entertain you.\n"
    puts "\nI am the computer.\n"
    puts "\nNice to meet you.\n\n"
  end

  private
  def computer_choice
    @random = rand 9
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

module WinCondition
  CONDITION_ARRAY = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
end

class Game
  include Greetings
  include WinCondition
  @@times_played = 0

  attr_accessor :player_one_name
  attr_accessor :player_two_name
  attr_accessor :game_board_array

  def initialize
    initial_response
    @game_won = false
    @game_board_array = [Array.new(9, ' '), Array.new(9, false)]
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
    player = Player.new
    @player_one_name = player.player_one
    @player_two_name = player.player_two
  end

  private
  def player_choice number, player
    if number.to_i >= 0 && number.to_i < 9
      if player == @player_one_name && @game_board_array[1][number.to_i] == true && @game_board_array[0][number.to_i] == 'X'
        player_one_play
      end
      if player == @player_one_name && @game_board_array[1][number.to_i] == true && @game_board_array[0][number.to_i] == 'O'
        player_two_play
      end
      if player == @player_one_name && @game_board_array[1][number.to_i] == false
        @game_board_array[0][number.to_i] = 'X' 
        @game_board_array[1][number.to_i] = true 
      elsif (player == @player_two_name || player == 'Computer') && @game_board_array[1][number.to_i] == false
        @game_board_array[0][number.to_i] = 'O' 
        @game_board_array[1][number.to_i] = true
      end
    end
  end

  private
  def check_win symbol, condition_array, player
    i = 0
    loop do
      if @game_board_array[0][condition_array[i][0]] == symbol && @game_board_array[0][condition_array[i][1]] == symbol && @game_board_array[0][condition_array[i][2]] == symbol
        system("clear")
        puts "\n\n#{player} wins! Congratulations.\n\n"
        @game_won = true
      end
      i += 1
      if i == 7
        break
      end
    end
  end

  private
  def win_condition symbol, player
    i = 0
    loop do
      check_win symbol, CONDITION_ARRAY, player
      i += 1
      if i == 7
        break
      end
    end
  end

  

  public 
  def player_one_play
    if @game_won == false
      game_board @player_one_name, @game_board_array
      @x_marks_the_spot = gets.chomp
      chosen_number @x_marks_the_spot, @player_one_name
      win_condition 'X', @player_one_name
    end
  end

  public
  def player_two_play
    if @game_won == false
      game_board @player_two_name, @game_board_array
      @o_marks_the_spot = gets.chomp
      chosen_number @o_marks_the_spot, @player_two_name
      win_condition 'O', @player_two_name
    end
  end

  public
  def round round_one
      player_one_play
      player_two_play
  end

  public
  def round_plays round_one
    i = 0
    loop do
      round_one.round round_one
      i += 1
      if @game_won == true || i == 9 
        break
      end
    end
  end

  public
  def chosen_number number, player
    player_choice number, player
  end


  public
  def game_board player = @player_one, game_board_array = @game_board_array
    system("clear")
    puts "| #{@game_board_array[0][0]} | #{@game_board_array[0][1]} | #{@game_board_array[0][2]} |\n"
    puts "-------------\n"
    puts "| #{@game_board_array[0][3]} | #{@game_board_array[0][4]} | #{@game_board_array[0][5]} |\n"
    puts "-------------\n"
    puts "| #{@game_board_array[0][6]} | #{@game_board_array[0][7]} | #{@game_board_array[0][8]} |\n\n"
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
round_one.round_plays round_one


