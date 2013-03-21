class Cell
	attr_accessor :x, :y, :value

	def initialize(x=0, y=0, value=0)
		@x = x
		@y = y
		@value = value
	end
end

class Game 
	attr_accessor :squares

	def initialize 
		@squares = []
	end

	def square_marked(x,y,v)
		cell = Cell.new(x,y,v)
		 @squares << cell
	end

	def test_vertical_win?
		col1_x = 0
		col2_x = 0
		col3_x = 0
		col1_o = 0
		col2_o = 0
		col3_o = 0

		squares.each do |cell| 
			if lane1(cell.y) && state_o?(cell.value)
				col1_o += 1
			end
			if lane1(cell.y) && state_x?(cell.value)
				col1_x += 1
			end
			if lane2(cell.y) && state_o?(cell.value)
				col2_o += 1
			end
			if lane2(cell.y) && state_x?(cell.value)
				col2_x += 1
			end
			if lane3(cell.y) && state_o?(cell.value)
				col3_o += 1
			end
			if lane3(cell.y) && state_x?(cell.value)
				col3_x += 1
			end
		end
		if col1_x == 3 || col2_x == 3 || col3_x == 3
			return true
		elsif col1_o == 3 || col2_o == 3 || col3_o == 3
			return true
		else
			false
		end 
	end

	def test_horizontal_win?
		col1_x = 0
		col2_x = 0
		col3_x = 0
		col1_o = 0
		col2_o = 0
		col3_o = 0

		squares.each do |cell| 
			if lane1(cell.x) && state_o?(cell.value)
				col1_o += 1
			end
			if lane1(cell.x) && state_x?(cell.value)
				col1_x += 1
			end
			if lane2(cell.x) && state_o?(cell.value)
				col2_o += 1
			end
			if lane2(cell.x) && state_x?(cell.value)
				col2_x += 1
			end
			if lane3(cell.x) && state_o?(cell.value)
				col3_o += 1
			end
			if lane3(cell.x) && state_x?(cell.value)
				col3_x += 1
			end
		end
		if col1_x == 3 || col2_x == 3 || col3_x == 3
			return true
		elsif col1_o == 3 || col2_o == 3 || col3_o == 3
			return true
		else
			false
		end
	end

	def test_diagonal_win?
		total_x = 0
		total_o = 0
		squares.each do |cell|
			if diagonal_square?(cell.x, cell.y) && state_o?(cell.value)
				total_o += 1
			end
			if diagonal_square?(cell.x, cell.y) && state_x?(cell.value)
				total_x += 1
			end
		end
		if total_o == 3
			return true
		elsif total_x == 3
			return true
		else
			false
		end
	end

	def state_o?(cell_o)
		cell_o == 'o'
	end

	def state_x?(cell_x)
		cell_x == 'x'
	end

	def diagonal_square?(cellx, celly)
		cellx.abs == celly.abs
	end

	def lane1(cell)
		cell == -1
	end
	
	def lane2(cell)
		cell == 0
	end
	
	def lane3(cell)
		cell == 1
	end

end
