RSpec.shared_context "codes", a: :b do
  let!(:cpf_valid) { '98107788052' }
  let!(:cpf_valid_mask) { '084.701.700-15' }
  let!(:cpf_invalid) { '98107788000' }
end