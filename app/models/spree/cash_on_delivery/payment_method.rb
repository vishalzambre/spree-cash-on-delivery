module Spree
  class CashOnDelivery::PaymentMethod < Spree::PaymentMethod
    def payment_profiles_supported?
      false # we want to show the confirm step.
    end

    def payment_source_class
      Spree::CashOnDelivery::Transaction
    end

    def source_required?
      false
    end

    def method_type
      'cash_on_delivery'
    end

    def authorization
      self
    end
  end
end
