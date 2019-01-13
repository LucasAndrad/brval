require 'spec_helper'
require './spec/contexts/codes_context.rb'

RSpec.describe Brval do
  include_context 'codes'

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

      # Add a test with mask
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
      # Add a test with mask
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

  end
end
