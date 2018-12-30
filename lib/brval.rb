require "brval/version"
require "brval/cpf"

module Brval
  class Error < StandardError; end
  
  def self.cpf_valid?(cpf)
    Cpf.new().valid?(cpf)
  end

end
