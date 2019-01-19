module Cep
  class CepService
    attr_accessor :cep, :url

    def initialize cep
      @cep = cep.to_s.tr('^0-9', '')
    end

    def check
      json = load_cep_json
      json_valid?(json)
    end

    def info
      json = load_cep_json
      json_valid?(json) ? translate_params(json) : response_error
    end

    private

    def load_cep_json
      response = HTTParty.get(@url)
      return nil if response.code != 200
      JSON.parse(response.body)
    end

    def response_error
      { 'error' => "Nenhum cep encontrado para: #{@cep}" }
    end

  end
end