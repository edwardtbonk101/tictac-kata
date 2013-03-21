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

	it 'should test for 3 vertical os' do
		game = Game.new
		game.square_marked(-1,0,'o')
		game.square_marked(0,0,'o')
		game.square_marked(1,0,'o')
		game.test_vertical.should == 3
	end

	it 'should test for 3 horizontal os' do 
		game = Game.new
		game.square_marked(0,-1,'o')
		game.square_marked(0,0,'o')
		game.square_marked(0,1,'o')
		game.test_horizontal.should == 3
	end
end