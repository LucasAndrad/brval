require "brval/cpf"

module Brval
  module CpfCall

    def cpf_valid? cpf 
      Cpf.new().valid?(cpf)
    end

  end
end