module Brval
  class Cnpj < Val
    
    def valid?
      validate_cnpj
    end

    private

    NULLS = %w{11111111111111 22222222222222 33333333333333 44444444444444 55555555555555 66666666666666 77777777777777 88888888888888 99999999999999 00000000000000}.freeze

    # function from https://gist.github.com/lucascaton/1109488
    def validate_cnpj
      return false if @code.nil?
    
      value = @code.scan /[0-9]/
      if value.length == 14
        unless NULLS.include?(value.join)
          value = value.collect{|x| x.to_i}
          sum = value[0]*5+value[1]*4+value[2]*3+value[3]*2+value[4]*9+value[5]*8+value[6]*7+value[7]*6+value[8]*5+value[9]*4+value[10]*3+value[11]*2
          sum = sum - (11*(sum/11))
          result1 = (sum==0 || sum==1) ? 0 : 11 - sum
          if result1 == value[12]
            sum = value[0]*6+value[1]*5+value[2]*4+value[3]*3+value[4]*2+value[5]*9+value[6]*8+value[7]*7+value[8]*6+value[9]*5+value[10]*4+value[11]*3+value[12]*2
            sum = sum - (11*(sum/11))
            result2 = (sum == 0 || sum == 1) ? 0 : 11 - sum
            return true if result2 == value[13] # valid CNPJ
          end
        end
      end
      false # invalid CNPJ
    end

  end
end