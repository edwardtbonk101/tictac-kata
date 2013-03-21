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

	def test_vertical
		col1 = 0
		col2 = 0
		col3 = 0
		squares.each do |cell| 
			if lane1(cell.y)
				col1 += 1
			end
			if lane2(cell.y)
				col2 += 1
			end
			if lane3(cell.y)
				col3+= 1
			end
		end
		if col1 == 3 || col2 == 3 || col3 == 3
			return 3
		end
	end

	def test_horizontal
		col1 = 0
		col2 = 0
		col3 = 0
		squares.each do |cell| 
			if lane1(cell.x)
				col1 += 1
			end
			if lane2(cell.x)
				col2 += 1
			end
			if lane3(cell.x)
				col3+= 1
			end
		end
		if col1 == 3 || col2 == 3 || col3 == 3
			return 3
		end
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
