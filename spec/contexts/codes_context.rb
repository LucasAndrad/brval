RSpec.shared_context "codes", a: :b do
  let!(:cpf_valid) { '98107788052' }
  let!(:cpf_valid_mask) { '084.701.700-15' }
  let!(:cpf_invalid) { '98107788000' }
  
  let!(:cnpj_valid) { '37711352000165' }
  let!(:cnpj_valid_mask) { '23.428.153/0001-30' }
  let!(:cnpj_invalid) { '37711352000100' }

  let!(:pis_valid) { '37893418268' }
  let!(:pis_valid_mask) { '648.79586.45-8' }
  let!(:pis_invalid) { '37800018268' }

  let!(:te_valid) { '557415802020' }
  let!(:te_valid_sp) { '168508380191' }
  let!(:te_valid_mg) { '185815740205' }
  let!(:te_invalid) { '043230002046' }
  # let!(:te_valid_mask) { '' }

end