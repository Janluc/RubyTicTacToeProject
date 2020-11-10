#!/usr/bin/env ruby
players = []
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
game_session = true
while game_session == true
  puts "\n#{players[0]} please choose a spot on the board"
  gets.chomp

  # print board

  puts "#{players[0]} chose a location"

  # check if player won
  if player_win
    puts "#{players[0]} has won!"
    game_session = false
  end

  # else change turn order
  players[0], players[1] = players[1], players[0]

end
