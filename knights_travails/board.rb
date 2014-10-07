class Board
  attr_reader :boxes, :length

  LETTER_STR = "_abcdefghij"

  def initialize(length)
    @length = length
    ar = (1..length).to_a
    @boxes = ar.product(ar).map do |(x,y)|
      Box.new(x, y, length)
    end
  end

  def paths(source_str, target_str)
    source = box(source_str)
    target = box(target_str)
    all_paths(source, target, [source.to_s])
  end

  def all_paths(source, target, current_path)
    results = nil

    if source.is_neighbor?(target)
      results = [current_path + [target.to_s]]
    else
      results = []
      source.neighbors.each do |(x,y)|
        neighbor = Box.new(x,y,length)
        next if current_path.include?(neighbor.to_s)
        current_path << neighbor.to_s
        results << all_paths(neighbor, target, current_path)
      end
    end

    results
  end

  def box(str_index)
    x,y = str_index.split('')
    coords = [str_to_number(x), y.to_i]
    boxes.detect do |box|
      box.coords == coords
    end
  end

  def str_to_number(str)
    LETTER_STR.index(str).to_i
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

  def to_s
    Board::LETTER_STR[coords[0]] + coords[1].to_s
  end

  def is_neighbor?(box)
    neighbors.detect {|n| n == box.coords }
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
