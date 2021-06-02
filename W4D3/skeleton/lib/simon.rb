require 'byebug'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over == true
      take_turn
      system("clear")
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    sleep(1)
    system("clear")
    require_sequence
    unless @game_over == true
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    print seq
    puts
  end

  def require_sequence
    puts "Please enter the first letter of each color one at a time"

    seq.each do |color|
      input = gets.chomp
      unless input.downcase == color[0]
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Good job."
  end

  def game_over_message
    puts "You lose. You made it #{sequence_length} rounds"
  end

  def reset_game
    @seq = []
    @sequence_length = 1
    @game_over = false
  end
end

# s = Simon.new
# s.play