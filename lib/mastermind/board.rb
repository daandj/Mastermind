module Mastermind
  class Board
    attr_accessor :grid, :won

    def initialize
      @grid = Array.new
      @won = false
    end

    def draw_board(score_array)
      @won = true if score_array.last[0] == 4
      @grid.each_with_index do |row_array, index|
        puts row_array.join(" ") + " | " + score_array[index][0].to_s + " placed correctly. " + score_array[index][1].to_s + " right number, wrong place."
      end
    end
  end
end
