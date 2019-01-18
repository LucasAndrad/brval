require "brval/cep/via_cep"

module Brval::CepCall

  def cep_valid?
    Cep::ViaCep.new('72110040').check
  end
  
  def nada
    p 'nada nada'
  end

end