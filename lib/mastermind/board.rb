module Mastermind
  class Board
    attr_accessor :grid

    def initialize
      @grid = Array.new
    end

    def draw_board(answer_array)
      @grid.each do |e|
        score_array = score(e, answer_array)
        puts e.join(" ") + " | " + score_array[0].to_s + " placed correctly. " + score_array[1].to_s + " right number, wrong place."
      end
    end

    private

    def score(row, answer)
      temp_answer = answer.deep_dup
      right_place = 0
      wrong_place = 0
      indexes = []
      row.each_with_index do |x, i|
        if temp_answer[i] == x
          indexes << i
          right_place += 1
        end
      end
      indexes.each do |i|
        temp_answer.delete(answer.at(i))
      end
      row.each_with_index do |x, i|
        if temp_answer.include?(x)
          temp_answer.delete(x)
          wrong_place += 1
        end
      end
      puts answer
      return [right_place, wrong_place]
    end
  end
end
