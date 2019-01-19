module Cep
  class Postmon
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
      # translate_params(json)
    end

    private

    def load_cep_json
      response = HTTParty.get(@url)
      return nil if response.code != 200
      JSON.parse(response.body)
    end

    def json_valid?(json)
      return false unless json['erro'].nil?
      json.key?('bairro') && json.key?('logradouro') && json.key?('cidade') && json.key?('estado')
    end

  end
end