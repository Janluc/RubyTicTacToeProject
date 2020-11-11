#!/usr/bin/env ruby
class Player
  attr_accessor :name, :token

  def initialize(name,token)
    self.name = name
    self.token = token
  end
end
class GameManager
  attr_accessor :game_session
  @@game_session=false
  @@players=[]
  @@playerwin=false
  
  def checkwin

  end
  def place_token
  end
  def coin_flip(choice)
    coin_flip = %w[H T].sample
    if coin_flip != coin_flip_choice
      puts "#{players[0]} lost the coin flip!"
      self.swap_player
    else
      puts "#{players[0]} won the coin flip!"
    end
    sleep(3)
  end
  def turn

  end
  def swap_player
    @@players[0], @@players[1] = @@players[1], @@players[0]
  end
  def check_valid_choice

  end
end
  
end
def display_board
  board = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  puts('  Tic Tac Toe')
  print("     |    | \n")
  print("  #{board[1]}  | #{board[2]}  | #{board[3]}\n")

  print("_____|____|_____\n")
  print("     |    |     \n")
  print("  #{board[4]}  | #{board[5]}  | #{board[6]}\n")

  print("_____|____|_____\n")
  print("     |    |     \n")
  print("  #{board[7]}  | #{board[8]}  | #{board[9]}\n")

  print("_____|____|_____\n")
  print("     |    |     \n")
end

players = []
player_win = false
player_draw = true
puts "\nWelcome to Ruby Tic Tac Toe! Please input a name for Player 1 \n \n"
players[0] = gets.chomp
puts "\nPlease input a name for Player 2 \n \n"
players[1] = gets.chomp

puts "\nPlayer 1: #{players[0]} and Player 2: #{players[1]} \n \n"

# Create board

puts "\n#{players[0]} please choose heads or tails (H/T) \n \n"

coin_flip_choice = gets.chomp

puts "\n#{players[0]} chose #{coin_flip_choice}"

# flip coin
coin_flip = %w[H T].sample
# decide if player one wins the coin toss
if coin_flip != coin_flip_choice
  puts "#{players[0]} lost the coin flip!"
  players[0], players[1] = players[1], players[0]
else
  puts "#{players[0]} won the coin flip!"
end
sleep(3)

# game loop
game_session = true
while game_session == true
  system 'clear'
  puts 'choose any number from 1-9 inclusive'
  # print board
  display_board
  puts "\n#{players[0]} please choose a spot on the board"
  choice = gets.chomp.to_i
  while choice < 1 || choice > 9
    puts 'chose a valid number for spot'
    choice = gets.chomp.to_i
  end
  puts "#{players[0]} chose a location"

  # check if player won
  if player_win
    puts "#{players[0]} has won!"
    game_session = false
  end

  if player_draw
    puts 'Draw Game!'
    game_session = false
  end
  # else change turn order
  players[0], players[1] = players[1], players[0]
  sleep(1)
end
