class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player_1 = name1
    @player_2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each_with_index do |ele, i|
      unless i == 6 || i == 13
        4.times { cups[i] << :stone }
      end
    end
  end

  def valid_move?(start_pos)
    raise ArgumentError.new "Invalid starting cup" if start_pos > 13
    raise ArgumentError.new "Starting cup is empty" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    moves = cups[start_pos].length
    cups[start_pos] = []
    i = start_pos + 1
    moves.times do
      if i == 13
        cups[i] << :stone
      else
        cups[i % 13] << :stone
      end
      i += 1
    end
    render
    next_turn(i % 13)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
