module Cep
  class Postmon

    # Thank you Postmon for this API
    # https://postmon.com.br/
    URL_HOME = 'https://api.postmon.com.br/v1/cep/'.freeze
    attr_accessor :cep, :url

    def initialize cep
      @cep = cep.tr('^0-9', '')
      @url = URL_HOME + @cep
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