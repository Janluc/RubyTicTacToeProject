#!/usr/bin/env ruby

puts "\nWelcome to Ruby Tic Tac Toe! Please input a name for Player 1 \n \n"
player_one_name = gets.chomp
puts "\nPlease input a name for Player 2 \n \n"
player_two_name = gets.chomp

puts "\nPlayer 1: #{player_one_name} and Player 2: #{player_two_name} \n \n"

# Create board

puts "\n#{player_one_name} please choose heads or tails (H/T) \n \n"

coin_flip_choice = gets.chomp

puts "\n#{player_one_name} chose #{coin_flip_choice}"

# flip coin

# decide if player one wins the coin toss
game_session = true
while game_session == true
  puts "\n#{player_one_name} please choose a spot in the board \n"
  gets.chomp

  puts "\n#{player_two_name} please choose a spot in the board \n"
  gets.chomp

  # Will loop until condition is met
  game_session = false
end

# print winner or draw

puts "\n#{player_one_name} has won!"
