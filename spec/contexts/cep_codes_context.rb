RSpec.shared_context "cep_codes", a: :b do
  let!(:cep_valid) { '70297400' }
  let!(:cep_valid_mask) { '70297-400' }
  let!(:cep_invalid) { '00000000' }
end