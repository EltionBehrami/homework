class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1 
    @game_over = false 
    @seq = []
  end

  def play
    until @game_over 
      take_turn
      system("clear")
    end
      game_over_message
      self.reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    sleep 0.50
    unless @game_over
      round_success_message
      @sequence_length += 1
    end 
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color 
      sleep 0.75
      system("clear")
      sleep 0.25
    end 
  end

  def require_sequence
    puts "Repeat the sequence by entering the first letter of each color and pressing the enter key "
      @seq.each do |color|
        user_color = gets.chomp 
        if color[0] != user_color
          @game_over = true 
          break
        end 
      end 
      sleep 0.25
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    system("clear")
    puts "Round successful."
    sleep 1.0
    system("clear")
    sleep 0.45
    puts "Next round:"
    sleep 1.0
    system("clear")
    sleep 0.45
  end

  def game_over_message
        system("clear")
        puts "Game over. You made it #{sequence_length - 1} rounds"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end



end

s = Simon.new

s.play