module Shufu
  class Line
    def initialize(base, schema, values)
      @base = base
      @schema = schema
      @values = values
    end

    def to_s
      [@base, items].flatten.join(" ")
    end

    def items
      @values.map { |k, v| Shufu::Item.new(@schema, k, v).to_s }
    end
  end
end
