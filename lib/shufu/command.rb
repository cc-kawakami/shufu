module Shufu
  class Command
    #
    # @param [Hash] schema
    #
    def initialize(schema)
      @schema = schema
    end

    #
    # @param [Hash] values
    # @return [String]
    #
    def to_s(values)
      arguments(@schema, values, []).join(" ")
    end

    #
    # @param [Hash] schema
    # @param [Hash] values
    #
    def arguments(schema, values, args)
      schema.each do |k, v|
        if v.is_a?(Hash)
          args = arguments(v, values, args).prepend(k)
        else
          args << Argument.new(name: k, type: v).to_s(values[k]) if values[k]
        end
      end

      args
    end
  end
end
