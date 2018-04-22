module CardConnect
  module Utils
    def set_attributes(attributes, fields)
      return if attributes.empty?
      attributes = attributes[0] if attributes.is_a? Array
      attributes = symbolize_keys(attributes)

      fields.each do |attr|
        next if attributes[attr].nil?
        send("#{attr}=", attributes[attr])
      end
    end

    def symbolize_keys(hash)
      hash.collect{|key, value| {key.to_sym => value} }.reduce({}, :merge)
    end
  end
end
