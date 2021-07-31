# frozen_string_literal: true

module Events
  module User
    # specify real table for STI
    class BaseEvent < Events::BaseEvent
      self.table_name = 'user_events'

      belongs_to :user, class_name: '::User', autosave: false
    end
  end
end

