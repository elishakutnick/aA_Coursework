#phase1 time complexity => O(n^2)
def my_min(nums)
  nums.each do |num|
    return num if nums.all?{ |num2| num2 > num }
  end
end

#phase2 time complexity => O(n)
def my_min(nums)
  smallest = nums.first
  nums.each do |num|
    smallest = num if num < smallest
  end
  smallest
end

#Largest Contiguous Sub-Sum
#phase1 

def largest_contiguous_subsum(list) #n^3 time complexity 
  sub_arrays = []

  (0...list.length).each do |i| #//n
    (i...list.length).each do |j| #//n
      sub_arrays << [i..j] #//n
    end
  end
  
  max = sub_arrays.first
  sub_arrays.each do |sub|
    max = sub if sub > max
  end

  max
end

def largest_contiguous_subsum(list)
    largest = list.first
    current = list.first

    (1...list.length).each do |i|
        current = 0 if current < 0
        current += list[i]
        largest = current if current > largest
    end

    largest
end

    list = [2, 3, -6, 7, -6, 7]
    p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

    list = [-5, -1, -3]
    p largest_contiguous_subsum(list) # => -1 (from [-1])

