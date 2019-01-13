require "brval/credit_card"

module Brval
  module CreditCardCall

    def credit_card_valid? credit_card 
      CreditCard.new(credit_card).valid?
    end

  end
end