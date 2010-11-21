module ActiveRecord
  module Persistance
    def update_attribute_with_validations(name, value)
      raise ActiveRecordError, "#{name} is marked as readonly" if self.class.readonly_attributes.include?(name.to_s)
      with_transaction_returning_status do
        send("#{name}=", value)
        save
      end
    end
    alias_method_chain :update_attribute, :validations
  end
end