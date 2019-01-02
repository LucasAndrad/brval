module Brval
    # Validate CNH
  class Cnh

    def valid? cnpj
      validate_cnh(cnpj)
    end

    private

    def validate_cnh(cnh)
      return false if cnh.length < 11
      return false if cnh[0] * 11 == cnh

      cnh_without_digits = cnh[0..8]
      cnh_digits = cnh[-2..-1]
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