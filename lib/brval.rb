require "brval/version"
require "brval/cpf_call"

module Brval
  extend CpfCall
  class Error < StandardError; end
  
  

end
