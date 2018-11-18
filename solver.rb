require_relative 'cell'
require_relative 'board'
require 'byebug'


B2 = Board.new('puzzles/easy_02.txt')
def solve_puzzles

	ez = ['easy_01.txt', 'easy_02.txt', 'easy_03.txt', 'easy_04.txt']

	med = ['medium_01.txt', 'medium_02.txt', 'medium_03.txt']

	hard = ['hard_01.txt', 'hard_02.txt']

	evil = ['evil_01.txt', 'evil_02.txt', 'evil_03.txt']

	empty = ['empty.txt']

	puzzles = ez + med + hard + evil + empty  

	puzzles.each do |puzzle|
		board = Board.new(File.join('puzzles', puzzle))
		board.pretty_print
		board.solve

		puts "\n\n"
		board.pretty_print
		puts "puzzle: \n#{puzzle}, solved: #{board.solved?}\n\n"
	end

end