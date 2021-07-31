module Commands
  module Base
    extend ActiveSupport::Concern

    included do
      include ActiveModel::Validations
    end

    class_methods do
      # Run validations and persist the event.
      #
      # On success: returns the event
      # On noop: returns nil
      # On failure: raise an ActiveRecord::RecordInvalid error
      def call(*args)
        new(*args).call
      end

      # Define the attributes.
      # They are set when initializing the command as keyword arguments and
      # are all accessible as getter methods.
      #
      # ex: `attributes :post, :user, :ability`
      def attributes(*args)
        attr_reader(*args)

        initialize_method_arguments = args.map { |arg| "#{arg}:" }.join(', ')
        initialize_method_body = args.map { |arg| "@#{arg} = #{arg}" }.join(";")

        class_eval <<~CODE
          def initialize(#{initialize_method_arguments})
            #{initialize_method_body}
            after_initialize
          end
        CODE
      end
    end

    def call
      return nil if event.nil?
      raise "The event should not be persisted at this stage!" if event.persisted?

      validate!
      execute!

      event
    end

    def validate!
      valid? || raise(ActiveRecord::RecordInvalid, self)
    end

    # A new record or nil if noop
    def event
      @event ||= build_event
    end

    # Save the event. Should not be overwritten by the command as side effects
    # should be implemented via Reactors triggering other Events.
    private def execute!
      event.save!
    end

    # Returns a new event record or nil if noop
    private def build_event
      raise NotImplementedError
    end

    # Hook to set default values
    private def after_initialize
      # noop
    end
  end
end
