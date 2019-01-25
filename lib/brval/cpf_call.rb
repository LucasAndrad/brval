require "brval/cpf"

module Brval
  module CpfCall

    def cpf_valid? cpf 
      Cpf.new(cpf).valid?
    end

    def cpf_mask cpf
      Cpf.new(cpf).mask
    end

  end
end