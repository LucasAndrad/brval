require "brval/cnpj"

module Brval
  module CnpjCall

    def cnpj_valid? cnpj
      Cnpj.new(cnpj).valid?
    end

  end
end