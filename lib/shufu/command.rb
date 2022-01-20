module Shufu
  class InvalidSchemaError < RuntimeError; end

  class Command
    def initialize(base, schema)
      @base = base
      @schema = schema.map { |s| Argument.new(**s) }
    end

    def line(values)
      Line.new(@base, @schema, values).to_s
    end
  end
end
