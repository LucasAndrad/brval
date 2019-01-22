module Cep
  class ViaCep < CepService

    URL_HOME = 'https://viacep.com.br/ws/'.freeze

    def initialize cep
      super
      @url = URL_HOME + @cep + '/json'
    end

    private

    def json_valid? json
      return false if json.nil? || json.key?('erro')
      json.key?('logradouro') && json.key?('bairro') && json.key?('localidade') && json.key?('uf')
    end

    def translate_params json
      json['address'] = json.delete 'logradouro'
      json['complement'] = json.delete 'complemento'
      json['neighborhood'] = json.delete 'bairro'
      json['city'] = json.delete 'localidade'
      json['state'] = json.delete 'uf'
      json['unit'] = json.delete 'unidade'
      json['ibge'] = json.delete 'ibge'
      json['gia'] = json.delete 'gia'
      json
    end

  end
end