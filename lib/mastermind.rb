require_relative 'mastermind/board'
require_relative 'mastermind/game'
require_relative 'mastermind/core_extensions'

game = Mastermind::Game.new(12)
game.random_code
game.start
