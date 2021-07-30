# frozen_string_literal: true

module Events
  module Wallet
    # deposit money to wallet
    class Create < BaseEvent
      data_attributes :user_id

      def apply(wallet)
        wallet.user_id = user_id

        wallet
      end
    end
  end
end

