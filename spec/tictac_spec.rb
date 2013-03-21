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
		game.square_marked(0,0,'o')
		game.squares.count.should == 1
	end

	it 'should store several cells into the squares array' do 
		game = Game.new
		game.square_marked(0,0,'o')
		game.square_marked(1,0,'o')
		game.square_marked(2,0,'o')
		game.squares.count.should == 3
	end

	it "should test for 3 vertical o's" do
		game = Game.new
		game.square_marked(-1,0,'o')
		game.square_marked(0,0,'o')
		game.square_marked(1,0,'o')
		game.test_vertical_win?.should == true
	end

	it "should test for 3 horizontal o's" do 
		game = Game.new
		game.square_marked(0,-1,'o')
		game.square_marked(0,0,'o')
		game.square_marked(0,1,'o')
		game.test_horizontal_win?.should == true
	end

	it "should test for 3 diagonal o's from bottom left to top right" do 
		game = Game.new
		game.square_marked(1,1,'o')
		game.square_marked(0,0,'o')
		game.square_marked(-1,-1,'o')
		game.test_diagonal_win?.should == true
	end

	it "should test for 3 diagonal o's from bottom right to top left" do 
		game = Game.new
		game.square_marked(-1,1,'o')
		game.square_marked(0,0,'o')
		game.square_marked(1,-1,'o')
		game.test_diagonal_win?.should == true
	end

	it "should not score a game as winning if there is a mix of x's and o's in a row" do
		game = Game.new
		game.square_marked(0,1,'o')
		game.square_marked(0,0,'x')
		game.square_marked(0,-1,'o')
		game.test_horizontal_win?.should == false
	end

	it "should not score a game as winning if there is a mix of x's and o's in a column" do 
		game = Game.new
		game.square_marked(1,0,'o')
		game.square_marked(0,0,'x')
		game.square_marked(-1,0,'o')
		game.test_horizontal_win?.should == false
	end

	it "should not score a game as winning if there is a mix of x's and o's in a diagonal" do 
		game = Game.new
		game.square_marked(1,1,'o')
		game.square_marked(0,0,'x')
		game.square_marked(-1,-1,'o')
		game.test_diagonal_win?.should == false
	end
end