module Mastermind
  class AI
    def initialize(role)
      @role = role
    end

    def score(grid, answer)
      score_array = []
      grid.each do |row|
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
        score_array << [right_place, wrong_place]
      end
      score_array
    end

    def guess_code
      code = Array.new(4) { rand(1..6) }
    end
  end
end
