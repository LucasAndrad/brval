require 'spec_helper'
require './spec/contexts/codes_context.rb'

RSpec.describe Brval do
  include_context "codes"

  describe "Brval tests" do

    context "CPF values" do
      it "should return true #cpf_valid?" do
        valid = Brval.cpf_valid?(cpf_valid)
        expect(valid).to be(true)
      end
    end

  end
end