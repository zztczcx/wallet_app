class UsersController < ApplicationController
  def index
  end

  def create
    Events::User::Create.create(data: { name: "user_#{User.count + 1}" })
    redirect_to action: :index
  end
end
