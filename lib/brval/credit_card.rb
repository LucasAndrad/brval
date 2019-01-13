module Brval
  class CreditCard < Val
    
    def validate_code
      raise ArgumentError, 'Credit card number must have 16 digits' if @code.length != 16
      value = @code.scan /[0-9]/
      if value.length == 16
        sum = sum_nums(value[0..14])
        sum_complete = treat_sum(sum.digits.reverse)
        return true if sum_complete - sum == value[15].to_i
      end
      false
    end

    def sum_nums nums
      sum = 0
      nums.each_with_index do |n, i|
        num = n.to_i
        if i%2 != 0
          sum += num
        else
          new_num = (num*2).digits.sum
          sum += new_num
        end
      end
      sum
    end

    def treat_sum nums
      if nums.last != 0
        nums[0] = nums[0]+1
        nums[nums.count-1] = 0
      end
      nums.join.to_i
    end

  end
end
# 1,2
# 3,4
# 5,6
# 7,8
# 9,10
# 11,12
# 13,14
# 15

# 3  0  1  1  1  1  9  8  7  6  3  3  3               
# x  x  x  x  x  x  x  x  x  x  x  x  x               
# 2  1  2  1  2  1  2  1  2  1  2  1  2

# 6 +0 +2 +1 +2 +1 +9*+8 +5*+6 +6 +3 +6=55 para 60=5(este é o DV). 

# 3011119876333