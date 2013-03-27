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

	def square_marked_modify(x_coord, y_coord, value, position)
		cell = Cell.new(x_coord, y_coord, value)
		@squares[position] = cell
	end

	def square_marked_new_game(x_coord, y_coord, value)
		cell = Cell.new(x_coord,y_coord,value)
		@squares << cell
	end

	def new_game
		counter = 1
		(-1..1).each do |i|
			(-1..1).each do |j|
				square_marked_new_game(j, (i * -1), counter.to_s)  
				counter += 1
			end
		end
	end

	def win?
		test_vertical_win? || test_horizontal_win? || test_diagonal_win?
	end

	def test_vertical_win?
		test_win(0,3,6) || test_win(1,4,7) || test_win(2,5,8)
	end

	def test_horizontal_win?
		test_win(0,1,2) || test_win(3,4,5) || test_win(6,7,8)
	end

	def test_diagonal_win?
		test_win(0,4,8) || test_win(2,4,6)
	end

	def we_have_a_winner
		puts "You win!"
		exit
	end

	def draw
		puts "It's a draw!"
		exit
	end

	def test_win(cell1,cell2,cell3)
		cell1_and_cell2?(cell1, cell2) && cell2_and_cell3?(cell2, cell3) 
	end

	def cell1_and_cell2?(cell1, cell2)
		squares[cell1].value == squares[cell2].value
	end

	def cell2_and_cell3?(cell2, cell3)
		squares[cell2].value == squares[cell3].value
	end

#---------------
# INTERFACE
#---------------
	def print_board
		puts "Where would you like to mark?"
		puts squares[0].value+" | "+squares[1].value+" | "+squares[2].value
		puts "----------"
		puts squares[3].value+" | "+squares[4].value+" | "+squares[5].value
		puts "----------"
		puts squares[6].value+" | "+squares[7].value+" | "+squares[8].value
	end

	def move(value)
		move = 0	
		print_board
		move = gets.chomp
		case move
			when "1"
				square_marked_modify(-1, 1, value, 0)
			when "2"
				square_marked_modify(0, 1, value, 1)
			when "3"
				square_marked_modify(1, 1, value, 2)
			when "4"
				square_marked_modify(-1, 0, value, 3)
			when "5"
				square_marked_modify(0, 0, value, 4)
			when "6"
				square_marked_modify(1, 0, value, 5)
			when "7"
				square_marked_modify(-1, -1, value, 6)
			when "8"
				square_marked_modify(0, -1, value, 7)
			when "9"
				square_marked_modify(1, -1, value, 8)
			else
				puts 'Please enter a valid move'
				move(value)
		end
	end

	def player_x
		value = 'x'
		move(value)
	end
	
	def player_o
		value = 'o'
		move(value)
	end

	def game_manager
		game = Game.new
		game.new_game
		(1..4).each do 
			puts "Player X"
			game.player_x
			if game.win?
				game.print_board
				we_have_a_winner
			end
			puts "Player O"
			game.player_o
			if game.win?
				game.print_board
				we_have_a_winner
			end
		end
		puts "Player X"
		game.player_x
		game.print_board
		if game.win?
			game.print_board
			we_have_a_winner
		end
		game.draw
	end
end

#game = Game.new
#game.game_manager