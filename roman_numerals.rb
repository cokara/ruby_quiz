def num_set 
[
  %w[I V],
  %w[X L],
  %w[C D],
  ["M",nil]
]
end

def to_roman(num)
  num = num.to_s
  roman_str = ''
  num.reverse.split(//).each_with_index do |c,i|
    int = c.to_i
    int_rom_str = case int
              when 1,2,3
                tmp = ''
                int.times{ tmp += num_set[i][0] }
                tmp
              when 4
                num_set[i][0] + num_set[i][1]
              when 5
                num_set[i][1]
              when 6,7,8
                tmp = num_set[i][1]
                int.times{ tmp += num_set[i][0] }
                tmp
              when 9
                num_set[i][0] + num_set[i+1][0]
              else
                ''
              end
    roman_str = int_rom_str + roman_str
  end
  roman_str
end
