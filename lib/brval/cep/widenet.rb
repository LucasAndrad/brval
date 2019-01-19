module Cep
  class Widenet

    # Thank you WideNet for this API
    # apps.widenet.com.br/busca-cep/api-de-consulta

    URL_HOME = 'http://apps.widenet.com.br/busca-cep/api/cep/'.freeze
    attr_accessor :cep, :url

    def initialize cep
      @cep = cep.tr('^0-9', '')
      @url = URL_HOME + @cep + '.json'
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
      return false if json['message'] == 'CEP não encontrado'
      json.key?('district') && json.key?('city') && json.key?('address') && json.key?('state')
    end

    def translate_params json
      json.delete 'status'
      json['cep'] = json.delete 'code'
      json['address'] = json.delete 'address'
      json['complement'] = ''
      json['neighborhood'] = json.delete 'district'
      json['city'] = json.delete 'city'
      json['state'] = json.delete 'state'
      json['unit'] = ''
      json['ibge'] = ''
      json['gia'] = ''
      json
    end

    
  end
end