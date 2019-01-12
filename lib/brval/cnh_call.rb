require "brval/cnh"

module Brval
  module CnhCall

    def cnh_valid? cnh
      Cnh.new(cnh).valid?
    end

  end
end