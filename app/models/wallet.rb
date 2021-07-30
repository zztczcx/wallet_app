# frozen_string_literal: true

class Wallet < ApplicationRecord
  belongs_to :user

  has_many :events, class_name: 'Events::Wallet::BaseEvent'
end
