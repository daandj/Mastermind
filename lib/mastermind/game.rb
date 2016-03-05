module Mastermind
  class Game
    def initialize(turns)
      @turn = 0
      @total_turns = turns
      @board = Board.new
      puts "Do you want to be A: codebreaker, or B: codemaker?"
      role = gets.chomp
      if role == "codemaker"
        @player = Player.new(:codemaker)
        @ai = AI.new(:codebreaker)
        puts "You've chosen to be a codemaker!"
      else
        @player = Player.new(:codebreaker)
        @ai = AI.new(:codemaker)
        puts "You've chosen to be a codebreaker!"
      end
    end

    def start
      if @player.role == :codemaker
        @code = gets.chomp.split(//).map { |e| e.to_i }
      else
        random_code
      end
      while @turn < @total_turns
        puts "Try a code"
        @board.grid << gets.chomp.split(//).map { |e| e.to_i }
        score_array = @ai.score(@board.grid, @code)
        @board.draw_board(score_array)
        @turn += 1
      end
    end

    def random_code
      @code = Array.new(4) { rand(1..6) }
    end
  end
end
