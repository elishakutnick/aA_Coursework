require 'benchmark'

def first_anagram?(str1, str2)
  str1_anagrams = str1.chars.permutation.map(&:join)
  str1_anagrams.include?(str2)
end
#O(n!)


def second_anagram?(str1, str2)
  str2_chars = str2.chars 

  str1.each_char do |char|
    idx = str2_chars.find_index(char)
    idx.nil? ? false : str2_chars.delete_at(idx)
  end

  str2_chars.empty? 
end
#O(n*m)


def third_anagram?(str1, str2)
    str1_arr = str1.split("").sort
    str2_arr = str2.split("").sort

    str1_arr == str2_arr
end
#nlog(n)

def fourth_anagram?(str1, str2)
    counter1 = Hash.new(0)
    counter2 = Hash.new(0)

    str1.each_char { |char| counter1[char] += 1 }
    str2.each_char { |char| counter2[char] += 1 }

    counter1 == counter2
end
#O(n+m)

def bonus_anagram?(str1, str2)
    result = Hash.new(0)
    merged = str1 + str2
    merged.each_char { |char| result[char] += 1 }
    # result.each_value {|val| return false if val != 2}
    result.length == merged.length / 2
    
end
#O(n) => still iterating only once

p bonus_anagram?("gizmo", "sally")    #=> false
p bonus_anagram?("elvis", "lives")    #=> true
