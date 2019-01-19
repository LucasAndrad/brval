require 'spec_helper'
require './spec/contexts/cep_codes_context.rb'

RSpec.describe Brval do
  include_context 'cep_codes'

  describe 'Postmon tests' do
    context 'Cep check method' do
      it 'should check a valid cep' do
        valid = Cep::Postmon.new(cep_valid).check
        expect(valid).to be(true)
      end

      it 'should check a valid cep with mask' do
        valid = Cep::Postmon.new(cep_valid_mask).check
        expect(valid).to be(true)
      end

      it 'should check a invalid cep' do
        invalid = Cep::Postmon.new(cep_invalid).check
        expect(invalid).to be(false)
      end
    end
  end

end