require "brval/version"
require "brval/cpf_call"
require "brval/cnpj_call"

module Brval
  extend CpfCall
  extend CnpjCall
  class Error < StandardError; end
  


end
