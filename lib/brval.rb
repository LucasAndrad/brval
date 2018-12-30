require "brval/version"
require "brval/cpf_call"

module Brval
  extend CpfCall
  class Error < StandardError; end
  
  # def self.cpf_valid?(cpf)
  #   Cpf.new().valid?(cpf)
  # end

end
