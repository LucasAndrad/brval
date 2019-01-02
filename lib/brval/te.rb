# Te = Titulo Eleitoral
module Brval
  class Te

    def valid? te
      validate_te(te)
    end

    private

    def validate_te te
      return false if te.nil?

      value = te.scan /[0-9]/
      if value.length == 12
        digit1 = calc_digit1(value)
        digit2 = calc_digit2(value, digit1)
        return true if value[10] == digit1 && value[11] == digit2
      end

      return false
    end

    def calc_digit1 nums
      sum = value[0]*9 + value[1]*8 + value[2]*7 + value[3]*6 + value[4]*5 + value[5]*4 + value[6]*3 + value[7]*2
      check_result(nums, sum)
    end

    def calc_digit2 nums, digit1
      sum = value[8]*4 + value[9]*3 + digit1*2
      check_result(nums, sum)
    end

    def check_result nums, sum
      rest = sum.module(11)
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