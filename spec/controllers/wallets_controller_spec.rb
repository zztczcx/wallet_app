require 'rails_helper'

describe WalletsController, type: :controller do
  let(:user) { create(:user, name: 'test_user') }
  let(:wallet) { create(:wallet, name: 'test_wallet', user: user, balance: 100) }
  let(:wallet_2) { create(:wallet, name: 'test_wallet_2', user: user, balance: 100) }

  describe '#create' do
    it 'creates a new wallet and a event' do
      post :create, params: {
        user_id: user.id
      }

      expect(Wallet.count).to eq(1)
      expect(Wallet.first.user).to eq(user)
      expect(Events::Wallet::Create.count).to eq(1)
    end
  end

  describe '#deposit' do
    it 'deposits money to wallet' do
      post :deposit, params: {
        user_id: user.id,
        amount: 100,
        id: wallet.id
      }

      expect(wallet.reload.balance).to eq(200)
      expect(Events::Wallet::Deposit.count).to eq(1)
    end
  end

  describe '#withdraw' do
    context 'balance is enough' do
      it 'withdraws money from wallet' do
        post :withdraw, params: {
          user_id: user.id,
          amount: 40,
          id: wallet.id
        }

        expect(wallet.reload.balance).to eq(60)
        expect(Events::Wallet::Withdraw.count).to eq(1)
      end
    end

    context 'balance is not enough' do
      it 'withdraws money from wallet' do
        post :withdraw, params: {
          user_id: user.id,
          amount: 140,
          id: wallet.id
        }

        expect(response.status).to eq(405)
      end
    end
  end

  describe '#pay' do
    it 'pays money to another wallet' do
      post :pay, params: {
        user_id: user.id,
        amount: 40,
        id: wallet.id,
        send_to_wallet_id: wallet_2.id
      }

      expect(wallet.reload.balance).to eq(60)
      expect(wallet_2.reload.balance).to eq(140)
      expect(Events::Wallet::Pay.count).to eq(1)
      expect(Events::Wallet::Receive.count).to eq(1)
    end
  end
end
