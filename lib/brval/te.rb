# Te = Titulo Eleitoral
module Brval
  class Te < Val

    private

    def validate_code
      return false if @code.nil?
      value = @code.split('')
      if value.length == 12
        value = value.collect{|x| x.to_i}
        digit1 = calc_digit1(value)
        digit2 = calc_digit2(value, digit1)
        return true if value[10] == digit1 && value[11] == digit2
      end

      return false
    end

    def calc_digit1 nums
      sum = nums[0]*9 + nums[1]*8 + nums[2]*7 + nums[3]*6 + nums[4]*5 + nums[5]*4 + nums[6]*3 + nums[7]*2
      check_result(nums, sum)
    end

    def calc_digit2 nums, digit1
      sum = nums[8]*4 + nums[9]*3 + digit1*2
      check_result(nums, sum)
    end

    def check_result nums, sum
      rest = sum.modulo(11)
      if rest == 0 || rest == 1
        if nums[8] == 0 && (nums[9] == 1 || nums[9] == 2)
          if rest == 0
            result = 1
          else
            result = 0
          end
        else
          result = 0
        end
      else
        result = 11 - rest
      end
    end

  end
end