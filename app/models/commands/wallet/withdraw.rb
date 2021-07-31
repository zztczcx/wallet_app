module Commands
  module Wallet
    class Withdraw
      include Commands::Base
      attributes :wallet_id, :amount
      validate :enough_balance?

      def build_event
        Events::Wallet::Withdraw.new(
          wallet_id: wallet_id,
          data: { amount: amount }
        )
      end

      def enough_balance?
        wallet = ::Wallet.find(wallet_id)
        if wallet.balance < amount
          errors.add(:balance, 'is not enough to withdraw')
        end
      end
    end
  end
end
