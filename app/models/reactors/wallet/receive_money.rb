class Reactors::Wallet::ReceiveMoney
  def self.call(event)
    from_wallet = event.wallet
    send_to_wallet_id = event.data['send_to_wallet_id']
    Events::Wallet::Receive.create(
      wallet_id: send_to_wallet_id,
      data: {
        amount: event.data['amount'],
        from_wallet_id: from_wallet.id
      }
    )
  end
end
