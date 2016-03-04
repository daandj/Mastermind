module Mastermind
  class Game
    def initialize(turns)
      @turn = 0
      @total_turns = turns
      @board = Board.new
    end

    def start
      puts @code
      while @turn < @total_turns
        puts "Pick a code"
        @board.grid << gets.chomp.split(//).map { |e| e.to_i }
        @board.draw_board(@code)
        @turn += 1
      end
    end

    def random_code
      @code = Array.new(4) { rand(1..6) }
    end
  end
end
