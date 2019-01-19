require 'httparty'
require 'brval/version'

require 'brval/val'
require 'brval/cnh_call'
require 'brval/cnpj_call'
require 'brval/cpf_call'
require 'brval/credit_card_call'
require 'brval/lawsuit_call'
require 'brval/pis_call'
require 'brval/renavam_call'
require 'brval/te_call'

require 'brval/cep/postmon'
require 'brval/cep/via_cep'
require 'brval/cep/widenet'
require 'brval/cep_call'

# main module
module Brval
  extend CnhCall
  extend CnpjCall
  extend CpfCall
  extend CreditCardCall
  extend LawsuitCall
  extend PisCall
  extend RenavamCall
  extend TeCall

  extend CepCall

  class Error < StandardError; end
end
