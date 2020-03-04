class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    while !game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if !self.game_over
      round_success_message
      self.sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
  end

  def require_sequence

  end

  def add_random_color
    self.seq << COLORS.sample
  end

  def round_success_message
    puts "SUCESS"
    puts "Next Round..."
  end

  def game_over_message
    puts "GAME OVER"
    puts "The correct sequence was: #{seq}"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end
