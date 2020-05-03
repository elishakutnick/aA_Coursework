def bad_two_sum?(array, target)
  (0...array.length).each do |i|
    (0...array.length).each do |j|
      return true if array[i] + array[j] == target && j > i
    end
  end
  false
end
#quadratic(O(n^2))

def okay_two_sum?(arr, target)
  return false if arr.length <= 1
  arr = arr.sort
  i = arr.length / 2
  j = i-1
        
  case (arr[i] + arr[j]) <=> target
  when 0
    return true
  when -1
    okay_two_sum?(arr[0..j], target)
  when 1
    okay_two_sum?(arr[i..-1], target)
  end
  false
end
#nlogn bc of sorting 

def two_sum?(arr, target)
  counter = Hash.new(0)
  arr.each do |ele|
    counter[ele] = target - ele
  end
  counter.each_value { |v| return true if counter.has_key?(v) }
  false
end
#O(n)

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false