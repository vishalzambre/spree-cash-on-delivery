Spree::Payment.class_eval do
  has_one :adjustment, as: :source, dependent: :destroy

  def build_source
    return if source_attributes.nil?

    if payment_method && payment_method.payment_source_class
      self.source = payment_method.payment_source_class.new(source_attributes)
      source.post_create(self) if source.respond_to?(:post_create)
    end
  end

  def update_adjustment(adjustment, src)
    source.update_adjustment(
      adjustment,
      src
    ) if source.respond_to?(:update_adjustment)
  end
end

