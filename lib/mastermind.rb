require_relative 'mastermind/board'
require_relative 'mastermind/game'
require_relative 'mastermind/core_extensions'
require_relative 'mastermind/player'

game = Mastermind::Game.new(12)
game.start
