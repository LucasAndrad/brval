require "brval/lawsuit"

module Brval
  module LawsuitCall

    def lawsuit_valid? lawsuit 
      Lawsuit.new().valid?(lawsuit)
    end

  end
end