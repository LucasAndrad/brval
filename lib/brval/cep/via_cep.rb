module Cep
  class ViaCep

    URL_HOME = 'https://viacep.com.br/ws/'.freeze
    attr_accessor :cep, :url

    def initialize cep
      @cep = cep.tr('^0-9', '')
      @url = URL_HOME + @cep + '/json'
    end

    def check
      json = load_cep_json
      json_valid?(json)
    end

    def info
      json = load_cep_json
      translate_params(json)
    end

    private

    def load_cep_json
      response = HTTParty.get(@url)
      return nil if response.code != 200
      JSON.parse(response.body)
    end

    def json_valid? json
      return false unless json['erro'].nil?
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