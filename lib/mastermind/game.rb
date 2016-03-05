module Mastermind
  class Game
    def initialize(turns)
      @turn = 0
      @total_turns = turns
      @won = false
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
        puts "Enter your code:"
        @code = gets.chomp.split(//).map { |e| e.to_i }
        if invalid?(@code)
          start
        else
          guess_code
        end
      else
        random_code
        let_guess
      end
    end

    def random_code
      @code = Array.new(4) { rand(1..6) }
    end

    private

    def guess_code
      while @turn < @total_turns && @won != true
        @board.grid << @ai.guess_code
        @won = @board.won
        @turn += 1
      end
      score_array = @ai.score(@board.grid, @code)
      @board.draw_board(score_array)
      if @won
        puts "I am the best!!"
      else
        puts "I guess your code was just too hard to break."
      end
    end

    def let_guess
      while @turn < @total_turns && @won != true
        puts "Try a code"
        code = gets.chomp.split(//).map { |e| e.to_i }
        while invalid?(code)
          puts "Invalid code! Try again."
          code = gets.chomp.split(//).map { |e| e.to_i }
        end
        @board.grid << code
        score_array = @ai.score(@board.grid, @code)
        @board.draw_board(score_array)
        @turn += 1
        @won = @board.won
      end
      if @won
        puts "You beat me! Wel done."
      else
        puts "You'll never beat me!!"
      end
    end

    def invalid?(code)
      if code.all? { |e| e >= 1 && e <= 6 } && code.length == 4
        false
      else
        true
      end
    end
  end
end
