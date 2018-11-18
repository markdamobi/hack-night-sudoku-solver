require_relative '../board' 

describe 'Board' do 
	let!(:ez1){ "../easy_01.txt" }
	let!(:board1) { Board.new(file: ez1)}
	describe '#initialize' do 
		it 'takes a file and initalizes board appropriately. filling in cells and other properties.' do 

		end

	end

	describe '#attempt_easy_solve' do 
		## basically iterates over all items in the board over and over again until an iteration causes no state change. 
		## this indicates that more strategy will then be needed. 
		## this method may not work for hard puzzles but might be sufficient for easy ones. 
		it 'attempts to solve board by filling in obvious missing values and reducing number of possible values for cell. no guessing. ' do 

		end
	end 

	describe '#solve' do 
		it 'solves any solvable puzzle' do 

		end
	end

	describe '#valid?' do 
		it 'determines if the board is in a valid state and there are no conflicts.' do 

		end
	end 

	describle '#scan cell' do 
		it 'does a scan through for a given cell and fixes in value or updates possible values' do 

		end
	end

	# describe '#solve_row' do 
	# 	it 'does 1 scan through a give row and tries to fix in values.' do 

	# 	end
	# end

	# describe

	describe '#rows_solved?' do 
		it 'determines if all rows in the board are solved' do 

		end
	end 	

	describe '#columns_solved?' do 
		it 'determines if all columns in the board are solved' do 

		end
	end 	

	describe '#boxes_solved?' do 
		it 'determines if all columns in the board are solved' do 

		end
	end 

	describe '#solved?' do 
		it 'determines if the sudoku board is completely solved' do 

		end
	end


	describe 'Visuals' do 
		describe '#pretty_print' do 
			it 'prints the current state of the sudoku board in a nice looking format.' do 

			end
		end


		describe '#file_format' do 
			it 'returns a representation of the board that matches the original file format' do 
				expect(board1.file_format).to eql ".256..49.\n7...2....\n.84.376..\n5.9....3.\n1.23.58.9\n.3....2.4\n..385.92.\n....9...3\n.91..357."
			end
		end

		describe '#array_format' do 
			it 'returns the values in the boars as a 2-d array' do

			end
		end

		describe '#string_rep' do
			## this can be useful to determine if something in the  board was changed after an iteration.  
			it 'returns a string representation of the board state including the state of possible values for a cell.' do 

			end
		end
	end


end