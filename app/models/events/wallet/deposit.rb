# frozen_string_literal: true

module Events
  module Wallet
    # deposit money to wallet
    class Deposit < BaseEvent
      data_attributes :amount

      def apply(wallet)
        wallet.balance += amount

        wallet
      end
    end
  end
end
