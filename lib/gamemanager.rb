class GameManager
  attr_accessor :game_session, :players, :board

  @@game_session = false
  def initialize(player_one, player_two)
    @players = []
    @players[0] = player_one
    @players[1] = player_two
    @board = ['0', 1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def check_win
    if @board[1] == @board[2] && @board[2] == @board[3] ||
       @board[4] == @board[5] && @board[5] == @board[6] ||
       @board[7] == @board[8] && @board[8] == @board[9] ||
       @board[1] == @board[4] && @board[4] == @board[7] ||
       @board[1] == @board[5] && @board[5] == @board[9] ||
       @board[3] == @board[5] && @board[5] == @board[7] ||
       @board[2] == @board[5] && @board[5] == @board[8] ||
       @board[3] == @board[6] && @board[6] == @board[9]
      true
    end
  end

  def check_draw
    @board.all? { |item| item.is_a?(String) }
  end

  def coin_flip(choice)
    coin_flip = %w[H T].sample
    coin_flip == choice
  end

  def swap_player
    @players[0], @players[1] = @players[1], @players[0]
  end

  def check_valid_choice(choice)
    false if choice < 1 || choice > 9 || @board[choice].is_a?(String)
  end
end
