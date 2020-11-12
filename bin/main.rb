#!/usr/bin/env ruby
require_relative '../lib/player'
require_relative '../lib/gamemanager'

def get_player_choice(player_name)
  puts "#{player_name} please choose a valid number from 1-9"
  gets.chomp
end

def display_board(board)
  system 'clear'
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

def init_player(player_number)
  puts "\nPlease input a name for Player #{player_number} \n \n"
  player_one_name = gets.chomp
  puts 'Enter your symbol'
  player_one_token = gets.chomp

  Player.new(player_one_name, player_one_token)
end

def token_length(player)
  until player.token.length == 1
    puts 'Symbols must be 1 character in length'
    player.token = gets.chomp
  end
end

def check_same_token(player_one, player_two)
  while player_one.token == player_two.token
    puts "#{player_two.name} symbol already chosen chose another symbol"
    player_two.token = gets.chomp
  end
end

def init_coin_flip(game)
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
end

play_again = true
while play_again == true
  player_one = init_player(1)
  token_length(player_one)

  player_two = init_player(2)
  token_length(player_two)
  check_same_token(player_one, player_two)

  game = GameManager.new(player_one, player_two)
  puts "\nPlayer 1: #{game.players[0].name} chose #{game.players[0].token} "
  puts "Player 2: #{game.players[1].name} chose #{game.players[1].token} \n \n"

  init_coin_flip(game)
  sleep(2)

  game.game_session = true
  while game.game_session == true

    display_board(game.board)
    choice = get_player_choice(game.players[0].name).to_i
    until game.check_valid_choice(choice)
      puts 'invalid choice'
      choice = get_player_choice(game.players[0].name).to_i
    end

    game.board[choice] = game.players[0].token

    if game.check_win
      display_board(game.board)
      puts "Congratulations! #{game.players[0].name} you win "
      game.game_session = false
    end

    if game.check_draw
      display_board(game.board)
      puts 'Draw Game! Game over!'
      game.game_session = false
    end

    game.swap_player

  end

  puts 'press Y or any key to play again? (Y/N)'
  if gets.chomp.upcase == 'N'
    puts 'Thank you for playing!'
    sleep(3)
    play_again = false

  end
  system 'clear'
end
