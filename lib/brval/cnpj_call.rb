require "brval/cnpj"

module Brval
  module CnpjCall

    def cnpj_valid? cnpj
      Cnpj.new(cnpj).valid?
    end

    def cnpj_mask cnpj
      Cnpj.new(cnpj).mask
    end

  end
end