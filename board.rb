require_relative 'cell'
class Board

	def initialize(file)
		@file = file 
		@cells = []
		read_file
		set_boxes
		set_rows
		set_columns
	end 

	attr_reader :file, :cells, :boxes, :rows, :columns


	def read_file
		return unless cells.empty?
		File.readlines(file).each_with_index do |line, y|
			line.strip.split("").each_with_index{ |val, x| @cells << Cell.new(x: x, y: y, value: val) }
		end
	end

	## this just attempts to put in value to a cell, or reduce the number of possible_values. 
	def resolve_cell(cell) 
		return if cell.value
		box_cells = boxes[cell.box]
		row_cells = rows[cell.y]
		col_cells = columns[cell.x]
		other_cell_values = Set.new(box_cells.map(&:value) + row_cells.map(&:value) + col_cells.map(&:value)).delete nil
		cell.possible_values -= other_cell_values
		cell.value = cell.possible_values.first if cell.possible_values.size == 1
		cell
	end

	def resolve_cells
		orig_uniq_str = unique_str
		cells.each do |cell|
			resolve_cell(cell)
		end
		orig_uniq_str != unique_str
	end

	## this scans grid and sets up possible values for cells and puts in values that already determined. 
	def pre_check
		state_changed = true
		while state_changed
			state_changed = resolve_cells
		end
	end

	def solve
		pre_check  
		return if solved? ## highly unlikely. 
		solve_recursive(cells.select{ |cell| !cell.value })
	end 


	## if this method ever returns false, it means the puzzle was invalid. 
	def solve_recursive(unsolved_cells)
		if unsolved_cells.empty?
			return true 
		else
			cell = unsolved_cells.first 
			cell.possible_values.each do |v|
				cell.value = v 
				if !conflict?(cell) && solve_recursive(unsolved_cells[1..-1])
					return true 
				end
			end
			cell.value = nil
			return false
		end
	end

	def conflict?(cell)
		return false if !cell.value 
		return true if boxes[cell.box].any?{|c| c.value == cell.value && c.object_id != cell.object_id}
		return true if rows[cell.y].any?{|c| c.value == cell.value && c.object_id != cell.object_id}
		return true if columns[cell.x].any?{|c| c.value == cell.value && c.object_id != cell.object_id}
		false
	end

	def solved?
		valid? && filled?
	end

	def valid?
		boxes.each do |b, bcells|
			vals = bcells.map(&:value).compact 
			return false unless vals == vals.uniq
		end 		
		rows.each do |r, rcells|
			vals = rcells.map(&:value).compact 
			return false unless vals == vals.uniq
		end 
		columns.each do |c, ccells|
			vals = ccells.map(&:value).compact 
			return false unless vals == vals.uniq
		end 
		true
	end

	def filled?
		cells.map(&:value).compact.size == 81
	end

	def set_boxes
		@boxes = cells.group_by{ |cell| cell.box }.sort_by{|box, _| box}.to_h
	end	

	def set_rows
		@rows = cells.group_by{|cell| cell.y}.sort_by{|y,_| y}.to_h
	end	

	def set_columns
		@columns = cells.group_by{|cell| cell.x}.sort_by{|x, _| x}.to_h
	end

	def file_format
		rows.map{|row, row_cells| row_cells.map{|cell| cell.value ? cell.value.to_s : "."}.join }.join("\n")
	end

	def unique_str
		cells.map(&:unique_str).join("|")
	end

	def pretty_print
		(0..2).each do |i|
			r = ""
			r << rows[i][0..2].map{|c| c.value || "_"}.join( " ")
			r << " | "
			r << rows[i][3..5].map{|c| c.value || "_"}.join( " ")
			r << " | "
			r << rows[i][6..8].map{|c| c.value || "_"}.join( " ")
			puts r
		end
		puts "====================="
		(3..5).each do |i|
			r = ""
			r << rows[i][0..2].map{|c| c.value || "_"}.join( " ")
			r << " | "
			r << rows[i][3..5].map{|c| c.value || "_"}.join( " ")
			r << " | "
			r << rows[i][6..8].map{|c| c.value || "_"}.join( " ")
			puts r
		end
		puts "====================="
		(6..8).each do |i|
			r = ""
			r << rows[i][0..2].map{|c| c.value || "_"}.join( " ")
			r << " | "
			r << rows[i][3..5].map{|c| c.value || "_"}.join( " ")
			r << " | "
			r << rows[i][6..8].map{|c| c.value || "_"}.join( " ")
			puts r
		end
	end

end