class WalletsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    Events::Wallet::Create.create(data: create_wallet_params)
    redirect_to controller: :users, action: :index
  end

  def withdraw
  end

  private

  def create_wallet_params
    {
      user_id: params[:user_id],
      name: "wallet_#{Wallet.count + 1}"
    }
  end
end
