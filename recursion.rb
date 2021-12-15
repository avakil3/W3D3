require "byebug"

def range(start,endd)
    return [] if endd < start 
    range(start,endd-1) << endd
end


def exp_1(base,exponent)
    return 1 if exponent == 0
    base * exp_1(base, exponent - 1)
end

def exp_2(base,exponent)
    return 1 if exponent == 0
    return base if exponent == 1
    if exponent.even?
        exp_2(base, exponent / 2) ** 2
    else
        base * (exp_2(base, (exponent - 1) / 2) ** 2)
    end
end

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

class Array
    def deep_dup
        return [] if self.empty?
        new_arr = []
         copy = self[0].map{|ele| ele}
         new_arr << copy
         new_arr += self[1..-1].deep_dup
         new_arr
    end
end

def fibs_recur(n)
    return [] if n == 0
    return [1] if n == 1
    return [1,1] if n == 2

    prev = fibs_recur(n-1)
    prev << prev[-1] + prev[-2]
    
end

def fibs_iter(n)
    return [] if n == 0
    return [1] if n == 1
    return [1,1] if n == 2

    fibs = [1,1]

    while fibs.length < n
        fibs << fibs[-1] + fibs [-2]
    end
    fibs
end

# p fibs_iter(8)  #1 1 2 3 5 

def bsearch(array, target)
    #debugger
    return nil if array.empty?

    middle_index = array.length / 2 
    middle_value = array[middle_index]


    case target <=> middle_value 
    when 1 # target > middle  = to the right = add onto index
        middle_index + bsearch(array[middle_index..-1], target)
        # middle_index + bsearch(array[middle_index+1..-1], target) + 1
    when 0 # target = middle    
        middle_index 
    when -1 #target < middle  = to the left = minus  index  
        bsearch(array[0...middle_index], target) #2 + 1 [1,2,3] 0([3]) + 1([1,2,3])+ ([1,2,3,4,5,6,7]
    end
end
p bsearch([1, 2, 3, 4, 5, 6, 7], 3) # => 2
p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3


# 1st  index = 0, middle index = 2, set index = 2
# 2nd  [4,5,6] index = 0(),  middle =1 , set index = 1(3?)
# 3rd [6]   index = 0
# p bsearch([1, 2, 3, 4, 5, 6], 1) # => 0  2 => 0

# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil 