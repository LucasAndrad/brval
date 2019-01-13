module Brval
  class Renavam < Val

    private

    def validate_code code
      code = "00" + code if code.length == 9
      ren_cut = code[0..9]
      ren_reverse = ren_cut.reverse[0..7]
      sum = 0
      (2..9).to_a.each do |i|
        sum += ren_reverse[i-2].to_i * i
      end
      sum += code[0].to_i*3 + code[1].to_i*2
      result1 = 11 - (sum % 11)
      digit1 = (result1 == 10 || result1 == 11) ? 0 : result1
      return true if code[10].to_i == digit1
      false
    end

  end
end
