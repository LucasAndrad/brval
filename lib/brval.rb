require 'brval/version'
require 'brval/cnh_call'
require 'brval/cnpj_call'
require 'brval/cpf_call'
require 'brval/lawsuit'
require 'brval/pis_call'
require 'brval/te_call'
# main module
module Brval
  extend CnhCall
  extend CnpjCall
  extend CpfCall
  extend Lawsuit
  extend PisCall
  extend TeCall

  class Error < StandardError; end
end
