require "brval/cpf"

module Brval
  module CpfCall

    def cpf_valid? cpf 
      Cpf.new(cpf).valid?
    end

  end
end