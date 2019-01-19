module Cep
  class Widenet < CepService

    # Thank you WideNet for this API
    # apps.widenet.com.br/busca-cep/api-de-consulta

    URL_HOME = 'http://apps.widenet.com.br/busca-cep/api/cep/'.freeze

    def initialize cep
      super
      @url = URL_HOME + @cep + '.json'
    end

    private

    def json_valid? json
      return false if json.key?('message')
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