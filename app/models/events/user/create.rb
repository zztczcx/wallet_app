# frozen_string_literal: true

module Events
  module User
    # create new user
    class Create < BaseEvent
      data_attributes :name

      def apply(user)
        user.name = name

        user
      end
    end
  end
end
