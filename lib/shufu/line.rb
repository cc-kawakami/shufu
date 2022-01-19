module Shufu
  class InvalidSchemaError < RuntimeError; end

  class Line
    def initialize(main, schema, values)
      @main = main
      schema = Shufu::Schema.call(schema)
      if schema.failure?
        raise Shufu::InvalidSchemaError, schema.errors(full: true).to_h
      end
      @schema = schema
      @values = values
    end

    def to_s
      [@main, items].flatten.join(" ")
    end

    def items
      @values.map { |k, v| Shufu::Item.new(@schema, k, v).to_s }
    end
  end
end
