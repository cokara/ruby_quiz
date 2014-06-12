require "./board.rb"
describe "Board" do
  describe "a new board" do
    it "should have 64 boxes" do
      board = Board.new(8)
      board.boxes.count.should == 64
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


describe "traversal" do
  it "should have a distance of 1 if the boxes is a neighbor" do
    board = Board.new(8)
    box
  end
end
