# frozen_string_literal: true

module Events
  module Wallet
    # receive money from other wallet
    class Receive < BaseEvent
      data_attributes :amount, :from_wallet_id

      def apply(wallet)
        wallet.balance += amount

        wallet
      end
    end
  end
end
