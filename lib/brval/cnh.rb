module Brval
    # Validate CNH
  class Cnh < Val

    private

    def validate_code
      return false if @code.length < 11
      return false if @code[0] * 11 == @code

      cnh_without_digits = @code[0..8]
      cnh_digits = @code[-2..-1]
      incr_dig2 = 0

      sum = 0
      mult = 9
      (0..8).each do |i|
        sum += cnh_without_digits[i].to_i * mult
        mult -= 1
      end

      digit1 = sum % 11
      incr_dig2 = -2 if digit1 == 10
      digit1 = 0 if digit1 > 9

      sum = 0
      mult = 1
      (0..8).each do |i|
        sum += (cnh_without_digits[i].to_i * mult)
        mult += 1
      end

      digit2 = if ((sum % 11) + incr_dig2) < 0
                  11 + (sum % 11) + incr_dig2
                else
                  (sum % 11) + incr_dig2
                end
      digit2 = 0 if digit2 > 9

      dig_to_compare = digit1.to_s + digit2.to_s

      return true if cnh_digits == dig_to_compare
      false
    end
  end
end