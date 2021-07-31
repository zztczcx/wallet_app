# frozen_string_literal: true

module Events
  module Wallet
    # dispatch event
    class Dispatcher < Events::Dispatcher
      on Events::Wallet::Pay, trigger: Reactors::Wallet::ReceiveMoney
    end
  end
end
