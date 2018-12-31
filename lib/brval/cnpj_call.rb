require "brval/cnpj"

module Brval
  module CnpjCall

    def cnpj_valid? cnpj
      Cnpj.new().valid?(cnpj)
    end

  end
end