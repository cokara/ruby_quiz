#! /usr/bin/ruby

args = ARGV
start = args[0]
stop = args[1]
options = args[2, args.size- 2] #rest of the args

def letter_index
  h = {}
  %w[a b c d e f g h].each_with_index do |letter,i|
    h[letter] = i + 1
  end
  h
end

#can you move from 
#from x1y1 to x2y2

def num_rep(box_str)
  [letter_index[box_str[0]],box_str[1].to_i]
end

def move_to_box(from,to)
  params = num_rep(from) + num_rep(to)
  move *params
end

def move(x1,y1,x2,y2)
  if (x2 - x1).abs != 0 && (y2 - y1).abs != 0
    if (x2 -x1).abs + (y2 -y1).abs == 3
      return [x2,y2]
    end
  end
  nil
end

def 
