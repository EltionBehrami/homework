class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      next if i == 13 || i == 6 
        4.times {cup << :stone}
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 12 || start_pos < 1 
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    cup_index = start_pos
    until stones.empty? 
      cup_index += 1
      cup_index = 0 if cup_index > 13 
      if cup_index == 6
        @cups[6] << stones.pop if current_player_name == @player1
      elsif cup_index == 13
        @cups[13] << stones.pop if current_player_name == @player2 
      else 
        @cups[cup_index] << stones.pop
      end
    end
    render 
    next_turn(cup_index)
  end 

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
      if ending_cup_idx == 6 ||ending_cup_idx == 13
        :prompt
      elsif 
        @cups[ending_cup_idx].count == 1
        :switch
      else 
      ending_cup_idx
      end
  end


  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..6].all {|cup| cup.empty?} || @cups[7..12].all? {|cup| cup.empty}
  end

  def winner
    player1_score = @cups[6].length
    player2_score = @cups[13].length

    if player1_score == player1_score
      :draw 
    elsif player1_score > player2_score
      return @player1
    else 
      return @player2
    end 
  end
end










