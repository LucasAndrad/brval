require "brval/pis"

module Brval
  module PisCall

    def pis_valid? pis
      Pis.new(pis).valid?
    end

  end
end