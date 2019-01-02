require "brval/te"

module Brval
  module TeCall

    def te_valid? te
      Te.new().valid?(te)
    end

  end
end