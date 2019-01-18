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
      # json_valid?(json)
    end

    def info
      
    end

    private

    def load_cep_json
      response = HTTParty.get(@url)
      return nil if response.code != 200
      JSON.parse(response.body)
    end

    def json_valid?(json)
      return false if json['erro'].present?
      json['logradouro'].present? && json['bairro'] && json['localidade'].present? && json['uf'].present?
    end

  end
end