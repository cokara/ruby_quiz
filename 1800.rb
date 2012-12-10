#! /usr/bin/ruby

DICT = '/usr/share/dict/american-english'

TABLE = {
         '2' => ['A','B','C'],
         '3' => ['D','E','F'],
         '4' => ['G','H','I'],
         '5' => ['J','K','L'],
         '6' => ['M','N','O'],
         '7' => ['P','Q','R','S'],
         '8' => ['T','U','V'],
         '9' => ['W','X','Y','Z']
        }

def all_poss(num_str)
  ar = num_str.split(//)
  first = ar.delete_at(0)
  rest = ar.map{|char| TABLE[char]}
  word_arrays = TABLE[first].product(*rest)
  words = word_arrays.map{|char_ar|  char_ar.join }
end

def words_in_dict(words)
  found = []
  words.each do |word|
    found << word if word_exists?(word)
  end
  found
end

def word_exists?(word)
  exists = false
  dict = File.open(DICT,'r') do |file|
    while(line = file.gets)
      if line.upcase.gsub(/\n/,'') == word.upcase
        exists = true
        break
      end
    end
  end
  exists
end

def words_for(num_str)
  all_words = all_poss(num_str)
  found_words = words_in_dict(all_words)
  puts found_words
end

words_for(ARGV[0])
