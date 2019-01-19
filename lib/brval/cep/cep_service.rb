module Cep
  class CepService
    attr_accessor :cep, :url

    def initialize cep
      @cep = cep.tr('^0-9', '')
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

  end
end