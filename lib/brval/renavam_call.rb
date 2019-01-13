require "brval/renavam"

module Brval
  module RenavamCall

    def renavam_valid? renavam
      Renavam.new(renavam).valid?
    end

  end
end