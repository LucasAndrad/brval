require "brval/pis"

module Brval
  module PisCall

    def pis_valid? pis
      Pis.new().valid?(pis)
    end

  end
end