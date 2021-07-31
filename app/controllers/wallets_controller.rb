class WalletsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    Events::Wallet::Create.create(data: wallet_create_data)
    redirect_to controller: :users, action: :index
  end

  def deposit
    Events::Wallet::Deposit.create(
      wallet_id: params[:id],
      data: wallet_deposit_data
    )
  end

  def withdraw
    command = Commands::Wallet::Withdraw.new(
      wallet_id: params[:id],
      amount: params[:amount].to_f
    )

    if command.valid?
      command.call
    else
      render json: {
        errors: command.errors
      }, status: 403
    end
  end

  def pay
    Events::Wallet::Pay.create(
      wallet_id: params[:id],
      data: wallet_pay_data
    )
  end

  def transactions
    @wallet = Wallet.find(params[:id])
    @events = @wallet.events

    render layout: false
  end

  private

  def wallet_create_data
    {
      user_id: params[:user_id],
      name: "wallet_#{Wallet.count + 1}"
    }
  end

  def wallet_deposit_data
    {
      amount: params[:amount].to_f
    }
  end

  def wallet_withdraw_data
    {
      amount: params[:amount].to_f
    }
  end

  def wallet_pay_data
    {
      amount: params[:amount].to_f,
      send_to_wallet_id: params[:send_to_wallet_id].to_i
    }
  end
end
