module Brval
  class Lawsuit

    LENGTH = 20.freeze

    def valid? lawsuit
      validate_lawsuit(lawsuit)
    end

    private

    def validate_lawsuit lawsuit=nil
      # remote_mask(lawsuit)
      # Add errors after initialize lawsuit this class if lawsuit has wrong value
      return false if lawsuit.nil?
      lawsuit_id = lawsuit.tr('^0-9', '')
      return false if lawsuit_id.length != LENGTH
      dv = lawsuit_id[7..8].to_i
      num_calc = (lawsuit_id[0..6]+lawsuit_id[9..19]).to_i
      dv_check = 98 - (num_calc*100).modulo(97)
      dv == dv_check ? true : false
    end
  end
end