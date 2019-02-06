require 'spec_helper'
require './spec/contexts/codes_context.rb'
require './spec/contexts/cep_codes_context.rb'

RSpec.describe Brval do
  include_context 'codes'
  include_context 'cep_codes'

  describe 'Brval tests' do
    context 'CPF values' do
      it 'should return true .cpf_valid?' do
        valid = Brval.cpf_valid?(cpf_valid)
        expect(valid).to be(true)
      end

      it 'should return false .cpf_valid?' do
        valid = Brval.cpf_valid?(cpf_invalid)
        expect(valid).to be(false)
      end

      it 'should return true .cpf_mask' do
        masked = Brval.cpf_mask(cpf_valid)
        expect(masked).to eql(cpf_valid.insert(3, '.').insert(7, '.').insert(11, '-'))
      end

      it 'should return false .cpf_mask' do
        masked = Brval.cpf_mask(cpf_valid)
        expect(masked).not_to eql(cpf_valid)
      end
    end

    context 'CNPJ values' do
      it 'should return true .cnpj_valid?' do
        valid = Brval.cnpj_valid?(cnpj_valid)
        expect(valid).to be(true)
      end

      it 'should return false .cnpj_valid?' do
        valid = Brval.cnpj_valid?(cnpj_invalid)
        expect(valid).to be(false)
      end

      it 'should return true .cnpj_mask' do
        masked = Brval.cnpj_mask(cnpj_valid)
        expect(masked).to eql(cnpj_valid.insert(2, '.').insert(6, '.').insert(10, '/').insert(15, '-'))
      end

      it 'should return false .cnpj_mask' do
        masked = Brval.cnpj_mask(cnpj_valid)
        expect(masked).not_to eql(cnpj_valid)
      end
    end

    context 'Pis values' do
      it 'should return true .pis_valid?' do
        valid = Brval.pis_valid?(pis_valid)
        expect(valid).to be(true)
      end

      it 'should return false .pis_valid?' do
        valid = Brval.pis_valid?(pis_invalid)
        expect(valid).to be(false)
      end

      # Add a test with mask
    end

    context 'Te (electoral title) values' do
      it 'should return true .te_valid?' do
        valid = Brval.te_valid?(te_valid)
        expect(valid).to be(true)
      end

      it 'should return true .te_valid? (Te code from Sao Paulo)' do
        valid = Brval.te_valid?(te_valid_sp)
        expect(valid).to be(true)
      end

      it 'should return true .te_valid? (Te code from Minas Gerais)' do
        valid = Brval.te_valid?(te_valid_mg)
        expect(valid).to be(true)
      end

      it 'should return false .te_valid?' do
        valid = Brval.te_valid?(te_invalid)
        expect(valid).to be(false)
      end

      # Add a test with mask
    end

    context 'CNH values' do
      it 'should be false if all digits are equal' do
        expect(Brval.cnh_valid?(cnh_invalid_equal)).to eq(false)
      end

      it 'should be false if cnh digits < 11' do
        expect(Brval.cnh_valid?('')).to eq(false)
      end

      it 'should be true with valid cnh' do
        expect(Brval.cnh_valid?(cnh_valid)).to eq(true)
      end

      it 'should be false with invalid cnh' do
        expect(Brval.cnh_valid?(cnh_invalid)).to eq(false)
      end
    end

    context 'Lawsuits values' do
      it 'should return true .lawsuit_valid?' do
        valid = Brval.lawsuit_valid?(lawsuit_valid)
        expect(valid).to be(true)
      end

      it 'should return true .lawsuit_valid? with mask' do
        valid = Brval.lawsuit_valid?(lawsuit_valid_mask)
        expect(valid).to be(true)
      end

      it 'should return false .lawsuit_valid?' do
        valid = Brval.lawsuit_valid?(lawsuit_invalid)
        expect(valid).to be(false)
      end
    end

    context 'Credit cards values' do
      it 'should return true .credit_card_valid?' do
        valid = Brval.credit_card_valid?(credit_card_valid)
        expect(valid).to be(true)
      end

      it 'should return true .credit_card_valid? with mask' do
        valid = Brval.credit_card_valid?(credit_card_valid_mask)
        expect(valid).to be(true)
      end

      it 'should return false .credit_card_valid?' do
        valid = Brval.credit_card_valid?(credit_card_invalid)
        expect(valid).to be(false)
      end
    end

    context 'Renavam values' do
      it 'should return true .renavam_valid?' do
        valid = Brval.renavam_valid?(renavam_valid)
        expect(valid).to be(true)
      end

      it 'should return false .renavam_valid?' do
        valid = Brval.renavam_valid?(renavam_invalid)
        expect(valid).to be(false)
      end
    end

    context 'Cep values' do
      it 'should return true .cep_valid?' do
        valid = Brval.cep_valid?(cep_valid)
        expect(valid).to be(true)
      end

      it 'should return false .cep_valid?' do
        valid = Brval.cep_valid?(cep_invalid)
        expect(valid).to be(false)
      end

      it 'should return the info for a valid cep .cep_info' do
        info = Brval.cep_info(cep_valid)
        expect(info['address']).to eq('EQS 414/415')
      end

      it 'should not return the info for invalid cep .cep_info' do
        info = Brval.cep_info(cep_invalid)
        expect(info['error']).to eq("Nenhum cep encontrado para: #{cep_invalid}")
      end
    end

  end
end
