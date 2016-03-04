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
        puts "You've chosen to be a codemaker!"
      else
        @player = Player.new(:codebreaker)
        puts "You've chosen to be a codebreaker!"
    end

    def start
      if @player.role == :codemaker
        @code = gets.chomp.split(//).map { |e| e.to_i }
      else
        random_code
      end
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
