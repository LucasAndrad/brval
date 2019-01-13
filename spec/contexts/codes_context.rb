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
  # let!(:te_valid_mask) { '' }
  let!(:te_valid_sp) { '168508380191' }
  let!(:te_valid_mg) { '185815740205' }
  let!(:te_invalid) { '043230002046' }

  let!(:cnh_valid) { '05639933755' }
  # let!(:cnh_valid_mask) { '' }
  let!(:cnh_invalid_equal) { '22222222222' }
  let!(:cnh_invalid) { '12345678912' }

  let!(:lawsuit_valid) { '00020802520125150049' }
  let!(:lawsuit_valid_mask) { '0002080-25.2012.5.15.0049' }
  let!(:lawsuit_invalid) { '00020802520125330099' }

  let!(:credit_card_valid) { '5121394634164123' }
  let!(:credit_card_valid_mask) { '5147 0366 1901 9661' }
  let!(:credit_card_invalid) { '5452843042855053' }

  let!(:renavam_valid) { '13976494983' }
  let!(:renavam_invalid) { '13976494113' }

end