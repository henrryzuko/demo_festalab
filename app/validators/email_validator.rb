class EmailValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)

        return if check_email(value)

        record.errors.add(
            attribute,
            :invalid_email,
            message: options[:message] || 'is not a valid email',
            value: value
        )

    end

    def check_email(email=nil)
        return false if email.nil?
        return false if email.blank?

        

        unless email =~ /^[-\w\.]+@([-\w]+\.)+[-\w]{2,4}$/i
            return false
        end
        
        return true
    end
end
