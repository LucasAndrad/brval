require "brval/renvam"

module Brval
  module RenvamCall

    def renvam_valid? renvam
      Renvam.new(renvam).valid?
    end

  end
end