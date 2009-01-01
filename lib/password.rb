module Mack
  module User
    class Password
      def initialize(string)
        @__hash = string.hexdigest
      end
    
      def to_s
        return @__hash
      end
    
      def ==(other)
        self.to_s == other.hexdigest
      end
    
    end
  end
end

module DataMapper
  module Types
    class MPassword < DataMapper::Type
      primitive String
      size 60
 
      def self.load(value, property)
        typecast(value, property)
      end
 
      def self.dump(value, property)
        typecast(value, property).to_s
      end
 
      def self.typecast(value, property)
        puts "value: #{value.inspect}"
        puts "property: #{property.inspect}"
        if value.nil?
          nil
        else
          value.is_a?(Mack::User::Password) ? value : Mack::User::Password.new(value)
        end
      end
    end # class BCryptHash
  end # module Types
end # module DataMapper