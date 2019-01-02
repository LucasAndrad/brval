module Brval
    # Validate CNH
  class Cnh
    def self.valid?(cnh)
      return false if cnh.length < 11
      return false if cnh[0] * 11 == cnh

      cnh_without_digits = cnh[0..8]
      cnh_digits = cnh[-2..-1]
      incr_dig2 = 0

      soma = 0
      mult = 9
      (0..8).each do |i|
        soma += cnh_without_digits[i].to_i * mult
        mult -= 1
      end

      digito1 = soma % 11
      incr_dig2 = -2 if digito1 == 10
      digito1 = 0 if digito1 > 9

      soma = 0
      mult = 1
      (0..8).each do |i|
        soma += (cnh_without_digits[i].to_i * mult)
        mult += 1
      end

      digito2 = if ((soma % 11) + incr_dig2) < 0
                  11 + (soma % 11) + incr_dig2
                else
                  (soma % 11) + incr_dig2
                end
      digito2 = 0 if digito2 > 9

      dig_to_compare = digito1.to_s + digito2.to_s

      return true if cnh_digits == dig_to_compare
      false
    end
  end
end