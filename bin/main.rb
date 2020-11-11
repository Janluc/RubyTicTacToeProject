#!/usr/bin/env ruby

def get_player_choice(player_name)
  puts "#{player_name} please choose a valid number from 1-9"
  gets.chomp
end

class Player
  attr_accessor :name, :token

  def initialize(name, token)
    self.name = name
    self.token = token
  end
end
class GameManager
  attr_accessor :game_session, :players,:playerwin
  $board = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  @@playerwin = false
  @@game_session = false
  
  def initialize(player_one, player_two)
    @players = []
    @players[0] = player_one
    @players[1] = player_two
    
  end

  def checkwin
    if ($board[1]==$board[2]&&$board[2]==$board[3]||
      $board[4]==$board[5]&&$board[5]==$board[6]||
      $board[7]==$board[8]&&$board[8]==$board[9]||
      $board[1]==$board[4]&&$board[4]==$board[7]||
      $board[1]==$board[5]&&$board[5]==$board[9]||
      $board[3]==$board[5]&&$board[5]==$board[7]||
      $board[2]==$board[5]&&$board[5]==$board[8]||
      $board[3]==$board[6]&&$board[6]==$board[9])
      @@playerwin=true
    end
  end

  def place_token
  end

  def coin_flip(choice)
    coin_flip = %w[H T].sample
    if coin_flip != choice
      false
    else
      true
    end
  end
  def turn

  end

  def swap_player
    @players[0], @players[1] = @players[1], @players[0]
  end

  def check_valid_choice

  end

end

def display_board

  puts('  Tic Tac Toe')
  print("     |    | \n")
  print("  #{$board[1]}  | #{$board[2]}  | #{$board[3]}\n")

  print("_____|____|_____\n")
  print("     |    |     \n")
  print("  #{$board[4]}  | #{$board[5]}  | #{$board[6]}\n")

  print("_____|____|_____\n")
  print("     |    |     \n")
  print("  #{$board[7]}  | #{$board[8]}  | #{$board[9]}\n")

  print("_____|____|_____\n")
  print("     |    |     \n")
end



puts "\nWelcome to Ruby Tic Tac Toe! Please input a name for Player 1 \n \n"
player_one_name = gets.chomp
puts "Enter your symbol"
player_one_token = gets.chomp
puts "\nPlease input a name for Player 2 \n \n"
player_two_name = gets.chomp
puts "Enter your symbol"
player_two_token = gets.chomp
while player_one_token==player_two_token
  puts " #{player_two_name} symbol already chosen chose another symbol"
  player_two_token = gets.chomp
end

game = GameManager.new(Player.new(player_one_name, player_one_token), Player.new(player_two_name, player_two_token))
puts "\nPlayer 1: #{game.players[0].name} chose #{game.players[0].token}   Player 2: #{game.players[1].name} chose #{game.players[1].token} \n \n"

# Create $board

puts "\n#{game.players[0].name} please choose heads or tails (H/T) \n \n"

coin_flip_choice = gets.chomp.upcase

puts "\n#{game.players[0].name} chose #{coin_flip_choice}"

flip_result = game.coin_flip(coin_flip_choice)

if !flip_result
  puts "#{game.players[0].name} lost the coin toss!"
  game.swap_player
else
  puts "#{game.players[0].name} won the coin toss!"
end

puts ''
puts game.players[0].name
sleep(2)

game.game_session = true
while game.game_session == true
  display_board
  choice=get_player_choice(game.players[0].name).to_i
  while(choice<1||choice>9||$board[choice].is_a?(String))
    puts "invalid choice"
    choice=get_player_choice(game.players[0].name).to_i
  end
  $board[choice]=game.players[0].token
  game.checkwin
  if game.playerwin
    puts "Congratulations! #{game.player[0].name} you win "
    game.game_session=false
  end
  game.swap_player
  
  
end











# # game loop
# game_session = true
# while game_session == true
#   system 'clear'
#   puts 'choose any number from 1-9 inclusive'
#   # print board
#   display_board
#   puts "\n#{players[0]} please choose a spot on the board"
#   choice = gets.chomp.to_i
#   while choice < 1 || choice > 9
#     puts 'chose a valid number for spot'
#     choice = gets.chomp.to_i
#   end
#   puts "#{players[0]} chose a location"

#   # check if player won
#   if player_win
#     puts "#{players[0]} has won!"
#     game_session = false
#   end

#   if player_draw
#     puts 'Draw Game!'
#     game_session = false
#   end
#   # else change turn order
#   players[0], players[1] = players[1], players[0]
#   sleep(1)
# end
