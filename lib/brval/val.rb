module Brval
  class Val

    attr_accessor :code

    def initialize(code)
      return if code.nil?
      @code = code.tr('^0-9', '')
    end

    def mask
      return if @code.nil?
      code_mask = @code.dup
    end

    def valid?
      return false if @code.nil?
      validate_code
    end

  end
end
