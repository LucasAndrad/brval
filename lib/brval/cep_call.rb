module Brval::CepCall

  def cep_valid?(cep)
    return false if cep.nil?
    call_apis(cep)
  end

  def call_apis(cep)
    via = Cep::ViaCep.new(cep).check
    widenet = Cep::Widenet.new(cep).check if via != true
    postmon = Cep::Postmon.new(cep).check if via != true && widenet != true
    return true if (via == true || widenet == true || postmon == true)
    false
  end

end