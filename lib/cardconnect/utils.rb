module CardConnect
  module Utils

    def set_attributes(attributes, fields)
      return if attributes.empty?
      attributes = attributes[0] if attributes.is_a? Array
      attributes = symbolize_keys(attributes)
      fields.each do |attr|
        next unless attributes[attr]
        send("#{attr}=", attributes[attr])
      end
    end

    def symbolize_keys(hash)
      symbolized_hash = {}
      hash.each do |k, v|
        symbolized_hash[k.to_sym] = v
      end
      symbolized_hash
    end

  end
end
