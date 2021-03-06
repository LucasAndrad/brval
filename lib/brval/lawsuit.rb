module Brval
  class Lawsuit < Val

    LENGTH = 20.freeze

    private

    def validate_code
      return false if @code.length != LENGTH
      dv = @code[7..8].to_i
      num_calc = (@code[0..6]+@code[9..19]).to_i
      dv_check = 98 - (num_calc*100).modulo(97)
      dv == dv_check ? true : false
    end
  end
end