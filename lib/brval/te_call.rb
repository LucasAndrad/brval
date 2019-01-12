require "brval/te"

module Brval
  module TeCall

    def te_valid? te
      Te.new(te).valid?
    end

  end
end