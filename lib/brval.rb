require 'brval/version'
require 'brval/val'
require 'brval/cnh_call'
require 'brval/cnpj_call'
require 'brval/cpf_call'
require 'brval/credit_card_call'
require 'brval/lawsuit_call'
require 'brval/pis_call'
require 'brval/te_call'
# main module
module Brval
  extend CnhCall
  extend CnpjCall
  extend CpfCall
  extend LawsuitCall
  extend PisCall
  extend TeCall

  class Error < StandardError; end
end
