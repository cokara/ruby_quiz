class Board
  attr_reader :boxes

  def initialize(length)
    ar = (1..length).to_a
    @boxes = ar.product ar
  end
end

class Box
  KNIGHT_MOVES = [[-1, -2], [-1, 2], [1, -2], [1, 2], [-2, -1], [-2, 1], [2, -1], [2, 1] ]
  attr_reader :limit, :coords, :neighbors

  def initialize(x,y,board_length)
    @limit = board_length
    @coords = [x, y]
    @neighbors = build_neighbors
  end

  def build_neighbors
    ar = []
    KNIGHT_MOVES.each do |move|
      box = box_at(move)
      ar << box if box
    end
    ar
  end

  def box_at(move)
    x,y = move
    new_x = coords[0] + x
    new_y = coords[1] + y
    if (0 < new_x && new_x <= limit) && (0 < new_y && new_y <= limit)
      return [new_x, new_y]
    else
      nil
    end
  end
end
