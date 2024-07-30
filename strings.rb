def anagram(string1, string2)
  if string1.chars.sort == string2.chars.sort
    puts "Exo 1 : function that checks if two strings are anagrams : TRUE"
  else
    puts "Exo 1 : function that checks if two strings are anagrams : FALSE"
  end
end

def string_compression(string)

  hash = Hash.new(0)
  string.downcase.each_char do |char|
    hash[char] += 1
  end

  result = hash.map{|k,v| "#{k}#{v}"}.join('')
  puts "Exo 2 : stringCompression : #{result}"
end

def find_all_indices_of_substring(string, substring)
  indices = []
  while string.index(substring) != nil
    last_indice = indices.size == 0 ? 0 : indices[-1] + 1
    index = string.index(substring)
    indices.push(index + last_indice)
    word_length = index + substring.length
    string = string[index + 1..-1]
  end

  puts "Exo 7 : find_all_indices_of_substring : #{indices}"
end


# main

anagram("silent", "listen")
string_compression("aabcccccaaa")
find_all_indices_of_substring("hello", "l")
find_all_indices_of_substring("abracadabracabra","abra")
