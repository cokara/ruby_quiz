require "./board.rb"
require 'pry'
describe "Board" do
  describe "a new board" do
    it "should have 64 boxes" do
      board = Board.new(8)
      board.boxes.count.should == 64
    end
  end

  describe('labels') do
    let(:board) { Board.new(8) }

    it 'returns the correct box' do
      box = board.box('a1')
      expect(box.coords).to eq([1,1])
    end

    it 'returns the no box if the box doesnt exists' do
      box = board.box('w4')
      expect(box).to be_nil
    end

  end
end

describe "Box" do
  context "a corner box (a1)" do
    it "should have 2 neighbors" do
      box = Box.new(1,1,8)
      box.neighbors.count.should == 2
    end
  end
  context "an edge box next to a corner box(a2)" do
    it "should have 3 neighbors" do
      box = Box.new(2,1,8)
      box.neighbors.count.should == 3
    end
  end
  context "an edge box (a3)" do
    it "should have 4 neighbors" do
      box = Box.new(3,1,8)
      box.neighbors.count.should == 4
    end
  end
  context "a inside box diagonally adjascent to a corner box(b2)" do
    it "should have 4 neighbors" do
      box = Box.new(2,2,8)
      box.neighbors.count.should == 4
    end
  end
  context "an inside box adjacent to an edge box (b3)" do
    it "should have a 6 neighbors" do
      box = Box.new(2,3,8)
      box.neighbors.count.should == 6
    end
  end
  context "an inside not adjascent to an edge box (c3)" do
    it "should have a 8 neighbors" do
      box = Box.new(3,3,8)
      box.neighbors.count.should == 8
    end
  end
end

describe "path to target" do

  let(:board) { Board.new(8) }

  context "one step away" do
    it 'path to the target should have only one box' do
      expect(board.paths('a1', 'b3')).to eq([['a1', 'b3']])
    end
  end

  context "two steps away" do
    it 'includes the 2 step path' do
      expect(board.paths('a1', 'c1')).to include([['a1', 'b3', 'c1']])
    end
  end
end


describe "traversal" do
  it "should have a distance of 1 if the boxes is a neighbor" do
    board = Board.new(8)
    #box
  end
end
