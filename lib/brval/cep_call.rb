require 'brval/cep/via_cep'
require 'brval/cep/widenet'

module Brval::CepCall

  def cep_valid?(cep)
    return false if cep.nil?
    cep = cep.to_s.tr('^0-9', '')
    call_apis(cep)
  end

  def call_apis(cep)
    via = Cep::ViaCep.new(cep).check
    widenet = Cep::Widenet.new(cep).check if vie != true
    return true if (via == true || widenet == true)
    false
  end

end