require_relative '../cell'

describe 'Cell' do 
	describe '#x and #y' do 
		it 'initializes the cell with the given position' do 
			cell = Cell.new(x: 0, y: 5)
			expect(cell.x).to eql 0
			expect(cell.y).to eql 5
			expect(cell.position).to match_array [0,5]
		end
	end

	describe '#value' do 
		context 'when value is specified' do
			it 'initializes the cell with intended value and sets possible values to be array with only the given value in it.' do 
				cell = Cell.new(x: 0, y: 0, value: 9)
				expect(cell.value).to eql 9
				expect(cell.possible_values).to match_array [9]
			end
		end

		context 'when no value is specified' do 
			it 'initializes possible values to be 1 - 9' do 
				cell = Cell.new(x: 0, y: 0)
				expect(cell.possible_values).to match_array [1,2,3,4,5,6,7,8,9]
			end
		end
	end

	describe '#box' do 
		it 'returns the box number for a given cell' do 
			expected_mapping = { 
				0=>[[0, 0], [0, 1], [0, 2], [1, 0], [1, 1], [1, 2], [2, 0], [2, 1], [2, 2]], 
				1=>[[3, 0], [3, 1], [3, 2], [4, 0], [4, 1], [4, 2], [5, 0], [5, 1], [5, 2]], 
				2=>[[6, 0], [6, 1], [6, 2], [7, 0], [7, 1], [7, 2], [8, 0], [8, 1], [8, 2]], 
				3=>[[0, 3], [0, 4], [0, 5], [1, 3], [1, 4], [1, 5], [2, 3], [2, 4], [2, 5]], 
				4=>[[3, 3], [3, 4], [3, 5], [4, 3], [4, 4], [4, 5], [5, 3], [5, 4], [5, 5]], 
				5=>[[6, 3], [6, 4], [6, 5], [7, 3], [7, 4], [7, 5], [8, 3], [8, 4], [8, 5]], 
				6=>[[0, 6], [0, 7], [0, 8], [1, 6], [1, 7], [1, 8], [2, 6], [2, 7], [2, 8]], 
				7=>[[3, 6], [3, 7], [3, 8], [4, 6], [4, 7], [4, 8], [5, 6], [5, 7], [5, 8]], 
				8=>[[6, 6], [6, 7], [6, 8], [7, 6], [7, 7], [7, 8], [8, 6], [8, 7], [8, 8]]
			}
			expected_mapping.each do |box_num, cell_positions|
				cell_positions.each do |x,y|
					cell = Cell.new(x: x, y: y)
					expect(cell.box).to eql box_num
				end
			end

		end
	end

	describe '#unique_str' do 
		it 'returns a string representation of the state of a cell. value + possible values. ' do 
			cell = Cell.new(x: 0, y: 0)
			expect(cell.unique_str).to eql "0+[123456789]"
			cell.possible_values = Set.new([1,2,3,5])
			expect(cell.unique_str).to eql "0+[1235]"
		end		
	end

end