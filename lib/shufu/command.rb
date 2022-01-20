module Shufu
  class InvalidSchemaError < RuntimeError; end

  class Command
    def initialize(base, schema)
      @base = base
      schema = Shufu::Schema.call({ schema: schema })
      if schema.failure?
        raise Shufu::InvalidSchemaError, schema.errors(full: true).to_h
      end
      @schema = schema.to_h[:schema]
    end

    def line(values)
      Line.new(@base, @schema, values).to_s
    end
  end
end
