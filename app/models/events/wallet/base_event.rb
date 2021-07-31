# frozen_string_literal: true

module Events
  module Wallet
    # specify real table for STI
    class BaseEvent < Events::BaseEvent
      self.table_name = 'wallet_events'

      belongs_to :wallet, class_name: '::Wallet', autosave: false

      private

      def dispatch
        Events::Wallet::Dispatcher.dispatch(self)
      end
    end
  end
end
