# frozen_string_literal: true

module Events
  module Wallet
    # create new wallet
    class Create < BaseEvent
      data_attributes :user_id, :name

      def apply(wallet)
        wallet.user_id = user_id
        wallet.name = name
        wallet.balance = 0

        wallet
      end
    end
  end
end
