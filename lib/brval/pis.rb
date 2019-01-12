module Brval
  class Pis < Val

    def valid?
      validate_pis
    end

    private

    def validate_pis
      return false if @code.nil?

      value = @code.scan /[0-9]/
      if value.length == 11
        value = value.collect{|x| x.to_i}
        sum = 3*value[0] + 2*value[1] + 9*value[2] + 8*value[3] + 7*value[4] + 6*value[5] + 5*value[6] + 4*value[7] + 3*value[8] + 2*value[9]
        result = 11 - sum.modulo(11)
        return true if result == value[10]
        return true if value[10] == 0 && (result == 10 || result == 11)
      end
      return false
    end

  end
end