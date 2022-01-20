module Shufu
  class Command
    #
    # @param [Array<Hash>] schema
    #
    def initialize(schema)
      @schema = schema.map { |s| Argument.new(**s) }
    end

    #
    # @param [Hash] values
    # @return [String]
    #
    def to_s(values)
      arguments(values).join(" ")
    end

    #
    # @reutrn [Array<String>]
    #
    def arguments(values)
      [commands] + values.map { |k, v|
        a = @schema.find { |a| a.name == k.to_s } || Argument.new(name: k)
        a.to_s(v)
      }
    end

    #
    # @return [Array<String>]
    #
    def commands
      @schema.select { |a| a.type == :command }.map(&:name)
    end
  end
end
