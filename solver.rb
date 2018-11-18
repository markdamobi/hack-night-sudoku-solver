require_relative 'cell'
require_relative 'board'
require 'byebug'


def solve_puzzles

  ez    = ['easy_01.txt', 'easy_02.txt', 'easy_03.txt', 'easy_04.txt']
  med   = ['medium_01.txt', 'medium_02.txt', 'medium_03.txt']
  hard  = ['hard_01.txt', 'hard_02.txt']
  evil  = ['evil_01.txt', 'evil_02.txt', 'evil_03.txt']
  empty = ['empty.txt']

  puzzles = ez + med + hard + evil + empty  

  puts "++++++++++++++++++++++++++++++++++++\n"
  puzzles.each do |puzzle|
    board = Board.new(File.join('puzzles', puzzle))
    board.pretty_print
    board.solve
    puts "\n"
    puts "\n"
    board.pretty_print
    puts "\npuzzle: #{puzzle}, solved: #{board.solved?}\n\n"
    puts "++++++++++++++++++++++++++++++++++++\n\n"
  end

end