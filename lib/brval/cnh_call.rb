require "brval/cnh"

module Brval
  module CnhCall

    def cnh_valid? cnh
      Cnh.new().valid?(cnh)
    end

  end
end