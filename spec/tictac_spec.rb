require 'tictac'
require 'spec_helper'

describe 'tictac' do 
	it 'should have cells' do
		cell = Cell.new
		cell.x.should == 0
		cell.y.should == 0 
	end

	it 'should store the active cells into an array' do 
		game = Game.new
		game.square_marked_new_game(0,0,'o')
		game.squares.count.should == 1
	end

	it 'should store several cells into the squares array' do 
		game = Game.new
		game.square_marked_new_game(0,0,'o')
		game.square_marked_new_game(1,0,'o')
		game.square_marked_new_game(2,0,'o')
		game.squares.count.should == 3
	end

	it 'should populate the board with pickable values' do 
		game = Game.new
		game.new_game
		game.squares.count.should == 9
	end

	it 'should be able to display the value of pickable cells' do 
		game = Game.new
		game.new_game
		game.squares[1].value.should == '2'
	end

	it 'should be able to display the value of an overridden cell' do 
		game = Game.new
		game.new_game
		game.square_marked_modify(0,0,'o',1)
		game.squares[1].value.should == 'o'
	end		

	it "should test for 3 horizontal o's" do
		game = Game.new
		game.new_game
		game.square_marked_modify(-1,0,'o',3)
		game.square_marked_modify(0,0,'o',4)
		game.square_marked_modify(1,0,'o',5)
		game.test_horizontal_win?.should == true
	end

	it "should test for 3 vertical o's" do 
		game = Game.new
		game.new_game
		game.square_marked_modify(0,-1,'o',7)
		game.square_marked_modify(0,0,'o',4)
		game.square_marked_modify(0,1,'o',1)
		game.test_vertical_win?.should == true
	end

	it "should test for 3 diagonal o's from bottom left to top right" do 
		game = Game.new
		game.new_game
		game.square_marked_modify(1,1,'o',2)
		game.square_marked_modify(0,0,'o',4)
		game.square_marked_modify(-1,-1,'o',6)
		game.test_diagonal_win?.should == true
	end

	it "should test for 3 diagonal o's from bottom right to top left" do 
		game = Game.new
		game.new_game
		game.square_marked_modify(-1,1,'o',0)
		game.square_marked_modify(0,0,'o',4)
		game.square_marked_modify(1,-1,'o',8)
		game.test_diagonal_win?.should == true
	end

	it "should not score a game as winning if there is a mix of x's and o's in a row" do
		game = Game.new
		game.new_game
		game.square_marked_modify(0,1,'o',1)
		game.square_marked_modify(0,0,'x',4)
		game.square_marked_modify(0,-1,'o',7)
		game.test_horizontal_win?.should == false
	end

	it "should not score a game as winning if there is a mix of x's and o's in a column" do 
		game = Game.new
		game.new_game
		game.square_marked_modify(1,0,'o',5)
		game.square_marked_modify(0,0,'x',4)
		game.square_marked_modify(-1,0,'o',3)
		game.test_horizontal_win?.should == false
	end

	it "should not score a game as winning if there is a mix of x's and o's in a diagonal" do 
		game = Game.new
		game.new_game
		game.square_marked_modify(1,1,'o',2)
		game.square_marked_modify(0,0,'x',4)
		game.square_marked_modify(-1,-1,'o',6)
		game.test_diagonal_win?.should == false
	end

	it "should not score a game as winning if there is not 3 of the same in a row" do 
		game = Game.new
		game.new_game
		game.square_marked_modify(-1,1,'x',0)
		game.square_marked_modify(0,1,'o',1)
		game.square_marked_modify(1,1,'x',2)
		game.square_marked_modify(-1,0,'o',3)
		game.square_marked_modify(0,0,'x',4)
		game.test_diagonal_win?.should == false
	end

	it "should score a game as winning if there is not 3 of the same in a row" do 
		game = Game.new
		game.new_game
		game.square_marked_modify(-1,1,'x',0)
		game.square_marked_modify(0,1,'o',1)
		game.square_marked_modify(1,1,'x',2)
		game.square_marked_modify(-1,0,'o',3)
		game.square_marked_modify(0,0,'x',4)
		game.square_marked_modify(1,0,'x',5)
		game.square_marked_modify(-1,-1,'x',6)
		game.test_diagonal_win?.should == true
	end
end
