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
    debugger
    return nil if array.empty?

    middle_index = array.length.even? ? array.length/2 - 1 : array.length / 2
    middle_value = array[middle_index]
    index = 0

    case target <=> middle_value 
    when 1 # target > middle  = to the right = add onto index
        bsearch(array[middle_index + 1..-1], target) #2 + 1 
        index += middle_index # = 2
    when 0 # target = middle    
        index += middle_index
    when -1 #target < middle  = to the left = minus  index  
        bsearch(array[0...middle_index], target) #2 + 1 
        index += (middle_index - array[0...middle_index].length) # = 2
    end
    index
end

def merge_sort(arr)
    #debugger
    if arr.length <= 1
        return arr
    else   #[2,3,1]
        middle_index = arr.length / 2
        left_half = merge_sort(arr[0...middle_index])
        right_half = merge_sort(arr[middle_index..-1])
        merge(left_half,right_half)
    end
end

def merge(left_array,right_array)
    #debugger
    sorted = []
    while !left_array.empty? && !right_array.empty?
        if left_array[0] < right_array[0]
            sorted << left_array.shift
        else
            sorted << right_array.shift
        end
    end
    sorted += left_array
    sorted += right_array
    sorted
end

p merge_sort([2,3,1,0,6,3])