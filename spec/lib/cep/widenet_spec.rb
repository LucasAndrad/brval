require 'spec_helper'
require './spec/contexts/cep_codes_context.rb'

RSpec.describe Brval do
  include_context 'cep_codes'

  describe 'Widenet tests' do
    context 'Cep check method' do
      it 'should check a valid cep' do
        valid = Cep::Widenet.new(cep_valid).check
        expect(valid).to be(true)
      end

      it 'should check a valid cep with mask' do
        valid = Cep::Widenet.new(cep_valid_mask).check
        expect(valid).to be(true)
      end

      it 'should check a invalid cep' do
        invalid = Cep::Widenet.new(cep_invalid).check
        expect(invalid).to be(false)
      end
    end

    context 'Cep info method' do
      it 'should get the info of a valid cep' do
        info = Cep::Widenet.new(cep_valid).info
        expect(info['address']).to eq('EQS 414')
      end

      it 'should get the info of a valid cep with mask' do
        info = Cep::Widenet.new(cep_valid_mask).info
        expect(info['address']).to eq('EQS 414')
      end

      # it 'should not get the info of an invalid cep' do
      #   info = Cep::Widenet.new(cep_invalid).info
      #   expect(info['error']).to eq('Nenhum cep encontrado')
      # end
    end
  end

end