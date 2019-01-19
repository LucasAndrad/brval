module Brval::CepCall

  def cep_valid?(cep)
    cep = cep.to_s.tr('^0-9', '')
    return false if cep.nil? || cep.length > 8
    call_apis_check(cep)
  end

  def cep_info(cep)
    cep = cep.to_s.tr('^0-9', '')
    return false if cep.nil? || cep.length > 8
    call_apis_check(cep)
  end

  private

  def call_apis_check(cep)
    via = Cep::ViaCep.new(cep).check
    widenet = Cep::Widenet.new(cep).check if via != true
    postmon = Cep::Postmon.new(cep).check if via != true && widenet != true
    return true if (via == true || widenet == true || postmon == true)
    false
  end

  def call_apis_info(cep)
    via = Cep::ViaCep.new(cep).info
    if via.key?('error')
      widenet = Cep::Widenet.new(cep).info
    else
      return via
    end
    if via.key?('error') && widenet.key?('error')
      postmon = Cep::Postmon.new(cep).info
    else
      return widenet
    end
    return postmon
  end

end