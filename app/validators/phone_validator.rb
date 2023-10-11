class PhoneValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)

        return if check_phone(value)

        record.errors.add(
            attribute,
            :invalid_phone,
            message: options[:message] || 'is not a valid phone',
            value: value
        )
    end

    def check_phone(phone=nil)
        return false if phone.nil?
        return false if phone.blank?

        unless phone =~ /^([+]?[\s0-9]+)?(\d{3}|[(]?[0-9]+[)])?([-]?[\s]?[0-9])+$/
            return false
        end

        return true
    end
end