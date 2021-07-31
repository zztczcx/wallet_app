# frozen_string_literal: true

module Events
  module Wallet
    # withdraw money from wallet
    class Withdraw < BaseEvent
      data_attributes :amount

      def apply(wallet)
        wallet.balance -= amount

        wallet
      end
    end
  end
end
