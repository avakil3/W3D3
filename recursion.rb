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
