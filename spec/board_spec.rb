require_relative '../board' 
require 'byebug'


### Tests are incomplete. 
### will fill them in later. 
### need to figure out why I can't read the file. 


# describe 'Board' do 
# 	let!(:board1) { Board.new(file: "./../puzzles/easy_01.txt")}
# 	let!(:empty_board) { Board.new("puzzles/empty.txt")}
# 	describe '#initialize' do 
# 		it 'takes a file and initalizes board appropriately. filling in cells and other properties.' do 

# 		end

# 	end

# 	# describe '#pre_check' do 
# 	# 	## basically iterates over all items in the board over and over again until an iteration causes no state change. 
# 	# 	## this indicates that more strategy will then be needed. 
# 	# 	it 'fills in values that are obvious. the sets the posibble values. ' do 

# 	# 	end
# 	# end 

# 	describe '#solve' do 
# 		it 'solves any solvable puzzle' do
# 			board1.solve
# 			expected_solution = ["325618497","716924385","984537612","569482731","142375869","837169254","473851926","258796143","691243578"]
# 			expect(board1.file_format).to eql expected_solution.join("\n")
# 		end
# 	end

# 	describe '#valid?' do 
# 		it 'determines if the board is in a valid state and there are no conflicts.' do 
# 			expect(empty_board.valid?).to eql true
# 			empty_board.cells[1].value = 5 
# 			expect(empty_board.valid?).to eql true
# 			empty_board.cells[2].value = 5
# 			expect(empty_board.valid?).to eql false
# 		end
# 	end 

# 	describe '#resolve_cell' do 
# 		it 'does a scan through for a given cell and fixes in value or updates possible values' do 

# 		end
# 	end	

# 	describe '#resolve_cells' do 
# 		it 'does 1 scan through all cells and indicates if any was made along the way.' do 

# 		end
# 	end

# 	describe '#solved?' do 
# 		it 'determines if the sudoku board is completely solved' do 

# 		end
# 	end


# 	describe 'Visuals' do 
# 		describe '#pretty_print' do 
# 			it 'prints the current state of the sudoku board in a nice looking format.' do 

# 			end
# 		end


# 		describe '#file_format' do 
# 			it 'returns a representation of the board that matches the original file format' do 
# 				expect(board1.file_format).to eql ".256..49.\n7...2....\n.84.376..\n5.9....3.\n1.23.58.9\n.3....2.4\n..385.92.\n....9...3\n.91..357."
# 			end
# 		end

# 		describe '#unique_str' do
# 			## this is useful to determine if something in the board was changed after an iteration.  
# 			it 'returns a string representation of the board state including the state of possible values for a cell.' do 

# 			end
# 		end
# 	end


# end