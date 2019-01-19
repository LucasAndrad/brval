module Cep
  class Postmon < CepService

    # Thank you Postmon for this API
    # https://postmon.com.br/
    
    URL_HOME = 'https://api.postmon.com.br/v1/cep/'.freeze

    def initialize cep
      super
      @url = URL_HOME + @cep
    end

    private

    def json_valid? json
      return false if json.nil?
      json.key?('bairro') && json.key?('logradouro') && json.key?('cidade') && json.key?('estado')
    end

    def translate_params json
      json['cep'] = json['cep'].insert(5, '-')
      json['address'] = json.delete 'logradouro'
      json['complement'] = ''
      json['neighborhood'] = json.delete 'bairro'
      json['city'] = json.delete 'cidade'
      json['state'] = json.delete 'estado'
      json['unit'] = ''
      json['ibge'] = json['cidade_info']['codigo_ibge']
      json['gia'] = ''
      json.delete 'estado_info'
      json.delete 'cidade_info'
      json
    end

  end
end