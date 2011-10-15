if ARGV[0] == "-s"
  size = ARGV[1].to_i
else
  size = 2
end

def print_number(num,size)
  num_array = []
  num.each_char{|c| num_array << c }
  print_top_bar(num_array,size)
  print_top_half(num_array,size)
  print_mid_bar(num_array,size)
  print_bottom_half(num_array,size)
  print_bottom_bar(num_array,size)
end

def print_top_bar(ar,size)
  ar.each do |char|
    print_space
    if %w[0 2 3 5 6 7 8 9].include? char
      size.times{ print_bar }
    else
      size.times{ print_space }
    end
    print_space
    print_space
  end
  print_new_line
end

def print_top_half(ar,size)
  size.times do
    ar.each do |char|
      if %w[0 4 5 6 8 9].include? char
        print_stick
      else
        print_space
      end
    
      size.times{ print_space}

      if %w[0 1 2 3 4 7 8 9].include? char
        print_stick
      else
        print_space
      end
      print_space
    end
    print_new_line
  end
end

def print_mid_bar(ar,size)
  ar.each do |char|
    print_space
    if %w[2 3 4 5 6 8 9].include? char
      size.times{ print_bar }
    else
      size.times{ print_space }
    end
    print_space
    print_space
  end
  print_new_line
end

def print_bottom_half(ar,size)
  size.times do
    ar.each do |char|
      if %w[0 2 6 8].include? char
        print_stick
      else
        print_space
      end
    
      size.times{ print_space}

      if %w[0 1 3 4 5 6 7 8 9].include? char
        print_stick
      else
        print_space
      end
      print_space
    end
    print_new_line
  end
end

def print_bottom_bar(ar,size)
  ar.each do |char|
    print_space
    if %w[0 2 3 5 6 8 9].include? char
      size.times{ print_bar }
    else
      size.times{ print_space }
    end
    print_space
    print_space
  end
  print_new_line
end

def print_bar
  print "-"
end

def print_stick
  print "|"
end

def print_space
  print " "
end

def print_new_line
  print "\n"
end
print_number(ARGV.last, size)
