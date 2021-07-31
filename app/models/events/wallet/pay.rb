# frozen_string_literal: true

module Events
  module Wallet
    # send money to other wallet
    class Pay < BaseEvent
      data_attributes :amount, :pay_to_wallet_id

      def apply(wallet)
        wallet.balance -= amount

        wallet
      end
    end
  end
end
