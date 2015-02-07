# Merge Sort

# 1. Recursively separate all elements into two lists until reaching size 1 per list
# 2. Merge each list

# how is array.length implemented in ruby. does it count each time it is called?
# does it count it the first time it is created and store it somewhere? this has
# performance implications.

def merge_sort(ary)
  # i don't particularly like an algorithm that counts the number of elements
  # in order to determine the length of the data set for each subset. Since
  # the length can be counted the very first time, the subsequent lengths
  # should simply be calculated and passed along instead of counted. 
  # However since the problem statement specifies the argument for merge_sort 
  # is only an array i can not pass the calculated length to each recursive 
  # merge_sort.
  length = ary.length
  return ary if length == 1
  # shift right is more efficient that divide by 2
  middle = length>>1
  #puts "middle = #{middle}"
  #print ary
  #puts
  left = merge_sort(ary[0..middle-1])
  right = merge_sort(ary[middle..length-1])
  merge(left,right)
end

def merge(ary1, ary2)
  merge_ary = []
  # since i'm not sure how length is implemented in ruby (ie. null terminated,
  # or a count is stored), i don't want to use it in a loop. instead if i
  # use empty?, in either case it should be constant time and therefore be a
  # faster implementation.
  while !ary1.empty? && !ary2.empty?
    merge_ary << ((ary1[0] < ary2[0]) ? ary1.shift : ary2.shift )
  end
  # now to handle when one or both arrays are now empty
  merge_ary.concat( (ary1.empty? ? ary2 : ary1) )
end

p merge_sort([3, 2, 5, 7, 7, 12, 6, 4])
#p merge_sort([2, 1])