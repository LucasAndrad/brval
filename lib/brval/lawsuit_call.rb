require "brval/lawsuit"

module Brval
  module LawsuitCall

    def lawsuit_valid? lawsuit 
      Lawsuit.new(lawsuit).valid?
    end

  end
end