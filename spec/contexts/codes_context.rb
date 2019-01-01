RSpec.shared_context "codes", a: :b do
  let!(:cpf_valid) { '98107788052' }
  let!(:cpf_valid_mask) { '084.701.700-15' }
  let!(:cpf_invalid) { '98107788000' }
  
  let!(:cnpj_valid) { '37711352000165' }
  let!(:cnpj_valid_mask) { '23.428.153/0001-30' }
  let!(:cnpj_invalid) { '37711352000100' }

end